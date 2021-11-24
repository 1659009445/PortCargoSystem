package service.impl;

import dao.CargoDao;
import dao.impl.CargoDaoImpl;
import dom.Cargo;
import dom.PageBean;
import service.CargoService;

import java.util.List;
import java.util.Map;

public class CargoServiceImpl implements CargoService {
    //使用dao层接口查询数据
    private CargoDao dao = new CargoDaoImpl();

    @Override
    public List<Cargo> findAll() {
        return dao.findAll();
    }

    @Override
    public void delCargoByid(int id) {
        dao.delCargoById(id);
    }

    @Override
    public void addCargo(Cargo cargo) {
         dao.addCargo(cargo);
    }

    @Override
    public PageBean<Cargo> findCargoByPage(String _currentPage, String _rows) {
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        //设置PageBean对象属性
        PageBean<Cargo> pc = new PageBean<Cargo>();
        pc.setCurrentPage(currentPage);
        pc.setRows(rows);

        int totalCount = dao.findTotalCount();
        pc.setTotalCount(totalCount);
        //计算开始索引
        int start = (currentPage-1)*rows;
        List<Cargo> list = dao.findCargoByPage(start,rows);
        pc.setList(list);
        //计算页码
        int totalPage=(totalCount % rows) == 0 ? totalCount/rows : (totalCount/rows) + 1;
        pc.setTotalPage(totalPage);
        //int totalPage = (int)Math.ceil(totalCount/(double)rows);
        //返回pc !这很重要
        return pc;
    }

    @Override
    public PageBean<Cargo> CargoFind(String _currentPage, String _rows, Map<String, String[]> condition) {
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        //设置PageBean对象属性
        PageBean<Cargo> pc = new PageBean<Cargo>();
        pc.setCurrentPage(currentPage);
        pc.setRows(rows);

        //dao
        int totalCount = dao.CargoFindTotalCount(condition);
        pc.setTotalCount(totalCount);
        //计算开始索引
        int start = (currentPage-1)*rows;
        List<Cargo> list = dao.CargoFind(start,rows,condition);
        pc.setList(list);
        //计算页码
        int totalPage=(totalCount % rows) == 0 ? totalCount/rows : (totalCount/rows) + 1;
        pc.setTotalPage(totalPage);
        //int totalPage = (int)Math.ceil(totalCount/(double)rows);
        //返回pc !这很重要
        return pc;
    }

    @Override
    public PageBean<Cargo> findCargoByUserId(String _currentPage, String _rows, String id) {
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        //设置PageBean对象属性
        PageBean<Cargo> pc = new PageBean<Cargo>();
        pc.setCurrentPage(currentPage);
        pc.setRows(rows);

        //dao
        int totalCount = dao.findCargoByUserIdTotalCount(id);
        pc.setTotalCount(totalCount);
        //计算开始索引
        int start = (currentPage-1)*rows;
        List<Cargo> list = dao.findCargoByUserId(start,rows,id);
        pc.setList(list);
        //计算页码
        int totalPage=(totalCount % rows) == 0 ? totalCount/rows : (totalCount/rows) + 1;
        pc.setTotalPage(totalPage);
        //int totalPage = (int)Math.ceil(totalCount/(double)rows);
        //返回pc !这很重要
        return pc;
    }

    @Override
    public Cargo findCargoById(int id) {
        return dao.findCargoById(id);
    }

    @Override
    public void updateUser(Cargo cargo) {
        dao.updateCargo(cargo);
    }


}
