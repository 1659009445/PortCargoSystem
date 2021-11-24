package service;

import dom.Cargo;
import dom.PageBean;

import java.util.List;
import java.util.Map;

/**
 * 货物业务接口
 */
public interface CargoService {
    public List<Cargo> findAll();

    public void delCargoByid(int id);

    public void addCargo(Cargo cargo);

    PageBean<Cargo> findCargoByPage(String currentPage, String rows);

    PageBean<Cargo> CargoFind(String currentPage, String rows, Map<String, String[]> condition);

    PageBean<Cargo> findCargoByUserId(String currentPage, String rows,String id);

    Cargo findCargoById(int id);

    void updateUser(Cargo cargo);
}