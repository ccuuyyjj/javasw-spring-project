package spring.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class SalesDao {
	private Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private RowMapper<Sales> rowMapper = (rs, index) -> {
		log.debug("여기");
		log.debug("cnt:" + rs.getInt("cnt"));
		log.debug("amount:" + rs.getInt("amount"));
		log.debug("dt:" + rs.getString("dt"));
		return new Sales(rs);
	};

	public List<Sales> sales_day_history(String sDate, String eDate) {
		String sql = "select x.dt as dt, count(x.rid) as cnt, sum(x.price) as amount " + "from ( "
				+ "	select TO_CHAR(enddate,'dd') AS dt, r_id as rid, sum(totalprice) as price "
				+ "	from reservation where progress=2 and enddate >= to_date(?, 'yyyymmdd') "
				+ "	and enddate < to_date(?,'yyyymmdd')+ 1/24 group by TO_CHAR(enddate,'dd'), r_id) x "
				+ "group by dt order by dt desc";
		Object[] args = new Object[] { sDate, eDate };
		return jdbcTemplate.query(sql, args, rowMapper);
	}

	public List<Sales> sales_month_history(String sDate, String eDate) {
		log.debug("sDate:" + sDate);
		log.debug("eDate:" + eDate);
		String sql = "select x.dt as dt, count(x.rid) as cnt, sum(x.price) as amount " + "from ("
				+ "    select TO_CHAR(enddate,'yyyymm') AS dt, r_id as rid, sum(totalprice) as price  "
				+ "    from reservation where progress=2 and enddate >= to_date(?, 'yyyymmdd') "
				+ "	and enddate < to_date(?,'yyyymmdd')+ 1/24 group by TO_CHAR(enddate,'yyyymm'), r_id) x "
				+ "group by x.dt order by dt ";
		Object[] args = new Object[] { sDate, eDate };
		return jdbcTemplate.query(sql, args, rowMapper);
	}
}
