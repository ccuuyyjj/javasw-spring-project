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
		return new Sales(rs);
	};

	public List<Sales> sales_day_history(String sDate, String eDate) {
		String sql = "select x.dt as dt, count(x.rid) as cnt, sum(x.price) as amount, "
				+ "count(distinct x.cancel) as cancel_cnt, sum(x.c_price) as cancel_amount " + "from ( "
				+ "	select TO_CHAR(enddate,'dd') AS dt, r_id as rid, sum(totalprice) as price, "
				+ "	max(case when progress=3 then r_id end) as cancel, "
				+ "	sum(case when progress=3 then NVL(totalprice, 0) as c_price "
				+ "	from reservation where progress=2 and enddate >= to_date(?, 'yyyymmdd') "
				+ "	and enddate < to_date(?,'yyyymmdd')+ 1/24 group by TO_CHAR(enddate,'dd'), r_id) x "
				+ "group by dt order by dt desc";
		log.debug("sql:" + sql);
		Object[] args = new Object[] { sDate, eDate };
		return jdbcTemplate.query(sql, args, rowMapper);
	}

	public List<Sales> sales_month_history(String sDate, String eDate) {
		String sql = "select x.dt as dt, count(x.rid) as cnt, sum(x.price) as amount, "
				+ "count(distinct x.cancel) as cancel_cnt, sum(x.c_price) as cancel_amount " + "from ( "
				+ "    select TO_CHAR(enddate,'yyyymm') AS dt, r_id as rid, sum(totalprice) as price, "
				+ "	max(case when progress=3 then r_id end) as cancel, "
				+ "	sum(case when progress=3 then NVL(totalprice, 0) as c_price"
				+ "    from reservation where progress=2 and enddate >= to_date(?, 'yyyymmdd') "
				+ "	and enddate < to_date(?,'yyyymmdd')+ 1/24 group by TO_CHAR(enddate,'yyyymm'), r_id) x "
				+ "group by x.dt order by dt ";
		Object[] args = new Object[] { sDate, eDate };
		return jdbcTemplate.query(sql, args, rowMapper);
	}
}
