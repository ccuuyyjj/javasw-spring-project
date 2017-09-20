package spring.model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class RoomDao {
	private Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private JdbcTemplate jdbcTemplate;
	private RowMapper<Room> rowMapper = (rs, i) -> {
		Room room = new Room(rs);

		if (room.getProgress() == 4) {
			Integer price = jdbcTemplate.queryForObject("select min(price) from available_date where room_no = ?",
					new Object[] { room.getNo() }, Integer.class);
			if (price != null) {
				room.setPrice(price);
			}
		}
		return room;
	};
	//호스트 등록
	public int insert(Room room) {
		int no = jdbcTemplate.queryForObject("select room_seq.nextval from dual", Integer.class);

		String sql = "insert into room values(?, ?, ?, ?, ?,     ?, ?, ?, ?, ?,    ?, ?, ?, ?, ?,    0, sysdate, ?, ?)";
		Object[] args = new Object[] { no, room.getName(), room.getType(), room.getPhotoUrl(), room.getRegion(),
				room.getLat(), room.getLng(), room.getAddress(), room.getCapacity(), room.getBeds(), room.getBedrooms(),
				room.getShared(), room.getBed_type(), room.getOwner_id(), room.getEtc(), room.getProgress(),
				room.getOptions() };

		if (jdbcTemplate.update(sql, args) > 0)
			return no;
		else
			return -1;
	}

	public List<Room> selectAll() {
		String sql = new SQL() {
			{
				SELECT("*");
				FROM("room");
				ORDER_BY("NO");
			}
		}.toString();
		// String sql = "select * from room order by no";
		return jdbcTemplate.query(sql, rowMapper);
	}

	public List<Room> selectPages(int page, int blockSize) {
		// System.out.println("selectPages");
		// int startBlock = (page - 1) * blockSize + 1;
		// int endBlock = startBlock + blockSize - 1;
		// String sql = new SQL() {{
		// SELECT("*");
		// FROM("("+
		// new SQL() {{
		// SELECT("rownum RN", "room.*");
		// FROM("room");
		// }}.toString()
		// +")");
		// WHERE("RN between " + startBlock + " AND " + endBlock);
		// ORDER_BY("no");
		// }}.toString();
		//// String sql = "select * from (select rownum RN, room.* from room) where RN
		// between " + startBlock + " and " + endBlock + " order by no";
		// return jdbcTemplate.query(sql, rowMapper);
		return search(page, blockSize, new String[] {}, new Object[] {});
	}

	public Room select(int no) {
		String sql = new SQL() {
			{
				SELECT("*");
				FROM("room");
				WHERE("no = ?");
			}
		}.toString();
		// String sql = "select * from room where no = ?";
		Object[] args = new Object[] { no };
		return jdbcTemplate.query(sql, args, rowMapper).get(0);
	}

	public List<Room> searchByDate(String date) {
		// System.out.println("searchByDate");
		// String sql = "select * from room where no = any(select no from (select
		// count(*) as c, room_no as no from available_date where day between ? and ?
		// and available = 'true' group by room_no) where c = ?) order by no";
		// int length = end.compareTo(start)+1;
		// Object[] args = new Object[] {start, end, length};
		// return jdbcTemplate.query(sql, args, rowMapper);
		return search(1, Integer.MAX_VALUE, new String[] { "date" }, new Object[] { date });
	}

	private DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");

	public List<Room> search(int page, int blockSize, Object[] arg_types, Object[] args) {
		int startBlock = (page - 1) * blockSize + 1;
		int endBlock = startBlock + blockSize - 1;

		if (arg_types.length != args.length)
			return null;
		else {
			List<Object> list = new ArrayList<>();
			String sql = new SQL() {
				{
					SELECT("*");
					FROM("(" + new SQL() {
						{
							SELECT("rownum RN", "room.*");
							FROM("room");
							for (int i = 0; i < arg_types.length; i++) {
								String type = (String) arg_types[i];
								Object arg = args[i];
								if (type.equalsIgnoreCase("date")) {
									try {
										String[] date = ((String) arg).split("~");

										Date start = dateFormat.parse(date[0]);
										Date end = dateFormat.parse(date[1]);
										int length = ((int) ((end.getTime() - start.getTime()) / 1000L / 60L / 60L
												/ 24L) + 1);

										WHERE("no = any(select n from (select count(*) as c, room_no as n from available_date where day between ? and ? and available = 'true' group by room_no) where c = ?)");
										list.add(start);
										list.add(end);
										list.add(length);
									} catch (ParseException e) {
									}
								} else if (type.equalsIgnoreCase("name") || type.equalsIgnoreCase("region")) {
									// name
									WHERE(type + " like ?");
									list.add("%" + arg + "%");
									// } else if(type.equalsIgnoreCase("none")) {
									// break;
								} else if (type.equalsIgnoreCase("type")) {
									// type
									String[] types = (String[]) arg;
									for (int j = 0; j < types.length; j++) {
										if (j > 0)
											OR();
										WHERE("type like ?");
										list.add("%" + types[j]);
									}
								} else if (type.equalsIgnoreCase("price")) {
									// price
									Integer price_min = ((int[]) arg)[0];
									Integer price_max = ((int[]) arg)[1];
									WHERE("no = any(select no from (select room_no as no, min(price) as min from available_date group by room_no) where min between ? and ?)");
									list.add(price_min);
									list.add(price_max);
								} else if (type.equalsIgnoreCase("filter")) {
									// filter
									try {
										Integer bedrooms = ((int[]) arg)[0];
										if (bedrooms != null) {
											WHERE("bedrooms >= ?");
											list.add(bedrooms);
										}
									} catch (Exception e) {
									}
									try {
										Integer beds = ((int[]) arg)[1];
										if (beds != null) {
											WHERE("beds >= ?");
											list.add(beds);
										}
									} catch (Exception e) {
									}
								} else if (type.equalsIgnoreCase("capacity")) {
									// amount
									try {
										Integer amount = (Integer) arg;
										if (amount != null) {
											WHERE("capacity >= ?");
											list.add(amount);
										}
									} catch (Exception e) {
									}
								} else {
									WHERE(type + " = ?");
									list.add(arg);
								}
							}
						}
					}.toString() + ")");
					WHERE("RN between " + startBlock + " AND " + endBlock);
					ORDER_BY("no");
				}
			}.toString();
			return jdbcTemplate.query(sql, list.toArray(), rowMapper);
		}
	}

	public int count() {
		return jdbcTemplate.queryForObject("select count(*) from room", Integer.class);
	}

	// 마이페이지 숙소 목록 리스트
	public List<Room> host_list(String id) {
		String sql = "select * from room where progress < 4 and owner_id = ? order by no desc ";
		return jdbcTemplate.query(sql, new Object[] { id }, rowMapper);
	}
	
	//마이페이지 숙소목록 - 예약관리 리스트
	public List<Room> host_list_complete(){
		//String sql = "select * from room where progress = 4 and owner_id = ? order by no desc";
		//return jdbcTemplate.query(sql, new Object[] { id }, rowMapper);
		String sql = "select * from room where progress = 4 and no in (7, 29) order by no desc";
		return jdbcTemplate.query(sql, rowMapper);
	}
	
	//호스트 수정
	public boolean update(Room room) {
		String sql = "update room  set name=?, type=?, photourl=?, region=?, lat=?, "
				+ "lng=?, address=?, capacity=?, beds=?, bedrooms=?, "
				+ "shared=?, bed_type=?, etc=?, reg=sysdate, progress=?, options=? " + "where no = ?";
		Object[] args = new Object[] { room.getName(), room.getType(), room.getPhotoUrl(), room.getRegion(),
				room.getLat(), room.getLng(), room.getAddress(), room.getCapacity(), room.getBeds(), room.getBedrooms(),
				room.getShared(), room.getBed_type(), room.getEtc(), room.getProgress(), room.getOptions(),
				room.getNo() };

		return jdbcTemplate.update(sql, args) > 0;

	}
	//호스트 삭제
	public boolean delete(String room_no) {
		String sql = "delete room where no = ?";
		return jdbcTemplate.update(sql, new Object[] { room_no }) > 0;
	}

}
