package dao;

import dom.Cargo;
import dom.User;

import java.util.List;
import java.util.Map;

/**
 * 货物dao层接口
 */
public interface CargoDao {
    //查询所有货物
    public List<Cargo> findAll();

    public void addCargo(Cargo cargo);

    public void delCargoById(int id);

    public void findCargoByid(int id);

    public void findCargoByUser(User user);

    public void findCargoByType(int typeid);

    public void findCargoByName(String name);

    public void findCargoByState(int state);

    public void findCargoByHarbour(int harbour);

    int findTotalCount();

    List<Cargo> findCargoByPage(int start, int rows);

    int CargoFindTotalCount(Map<String, String[]> condition);

    List<Cargo> CargoFind(int start, int rows, Map<String, String[]> condition);

    int findCargoByUserIdTotalCount(String id);

    List<Cargo> findCargoByUserId(int start, int rows, String id);


    Cargo findCargoById(int id);

    void updateCargo(Cargo cargo);
}
