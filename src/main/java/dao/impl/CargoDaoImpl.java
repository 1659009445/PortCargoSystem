package dao.impl;

import dao.CargoDao;
import dom.Cargo;
import dom.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class CargoDaoImpl implements CargoDao {
    //JdbcTemplate连接数据库
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public List<Cargo> findAll() {
        String sql = "select * from cargo";
        List<Cargo> cargo = template.query(sql, new BeanPropertyRowMapper<Cargo>(Cargo.class));
        return cargo;

    }

    @Override
    public void addCargo(Cargo cargo) {
        String sql="insert into cargo values(null,?,?,?,?,?,?,?)";
        template.update(sql,cargo.getName(),cargo.getWeight(),cargo.getTypeid(),cargo.getHarbourid(),cargo.getUserid(),cargo.getIntime(),cargo.getState());
    }

    @Override
    public void delCargoById(int id) {
        String sql="delete from cargo where id = ?";
        template.update(sql,id);
    }

    @Override
    public void findCargoByid(int id) {

    }

    @Override
    public void findCargoByUser(User user) {

    }

    @Override
    public void findCargoByType(int typeid) {

    }

    @Override
    public void findCargoByName(String name) {

    }

    @Override
    public void findCargoByState(int state) {

    }

    @Override
    public void findCargoByHarbour(int harbour) {

    }

    @Override
    public int findTotalCount() {
        String sql = "select count(*) from cargo";
        return template.queryForObject(sql,Integer.class);
    }

    @Override
    public List<Cargo> findCargoByPage(int start, int rows) {
        String sql = "select * from cargo limit ? , ?";
      return template.query(sql,new BeanPropertyRowMapper<Cargo>(Cargo.class),start,rows);
    }

    @Override
    public int CargoFindTotalCount(Map<String, String[]> condition) {
        String sql = "select count(*) from cargo where 1 = 1 ";
        //拼接字符串sb
        StringBuilder sb = new StringBuilder(sql);
        //遍历map获取值拼接sql
        Set<String> keySet = condition.keySet();
        //参数集合params
        List<Object> params = new ArrayList<Object>();
        for (String key : keySet) {
            //排除currentPage和rows两个参数
            if("currentPage".equals(key)||"rows".equals(key)){
                continue;
            }
            //此处默认只获取一个值
            String value = condition.get(key)[0];
            if(value!=null&&!"".equals(value)){
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");
            }
        }
        return template.queryForObject(sb.toString(),Integer.class,params.toArray());
    }

    @Override
    public List<Cargo> CargoFind(int start, int rows, Map<String, String[]> condition) {
        String sql = "select * from cargo where 1 = 1 ";
        //拼接字符串sb
        StringBuilder sb = new StringBuilder(sql);
        //遍历map获取值拼接sql
        Set<String> keySet = condition.keySet();
        //参数集合params
        List<Object> params = new ArrayList<Object>();
        for (String key : keySet) {
            //排除currentPage和rows两个参数
            if("currentPage".equals(key)||"rows".equals(key)){
                continue;
            }
            //此处默认只获取一个值
            String value = condition.get(key)[0];
            if(value!=null&&!"".equals(value)){
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");
            }
        }

        sb.append(" limit ? , ? ");
        params.add(start);
        params.add(rows);
        return template.query(sb.toString(),new BeanPropertyRowMapper<Cargo>(Cargo.class),params.toArray());
    }

    @Override
    public int findCargoByUserIdTotalCount(String _id) {
        String sql = "select count(*) from cargo where userid = ? ";
        int id =Integer.parseInt(_id);
        return template.queryForObject(sql,Integer.class,id);
    }

    @Override
    public List<Cargo> findCargoByUserId(int start, int rows, String _id) {
        String sql = "select * from cargo where userid = ? limit ? , ?";
        int id =Integer.parseInt(_id);
        return template.query(sql,new BeanPropertyRowMapper<Cargo>(Cargo.class),id,start,rows);
    }

    @Override
    public Cargo findCargoById(int id) {
        String sql = "select * from cargo where id = ?";
        return template.queryForObject(sql,new BeanPropertyRowMapper<Cargo>(Cargo.class),id);
    }

    @Override
    public void updateCargo(Cargo cargo) {
        String sql = "update cargo set name = ? , weight = ? , typeid = ? , harbourid = ? , userid = ? , intime = ? , state = ? where id = ?";
        template.update(sql,cargo.getName(),cargo.getWeight(),cargo.getTypeid(),cargo.getHarbourid(),cargo.getUserid(),cargo.getIntime(),cargo.getState(),cargo.getId());
    }


}
