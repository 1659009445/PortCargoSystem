package dom;

import org.apache.commons.beanutils.converters.DateConverter;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 货物
 *
 */
public class Cargo {
    //货物id
    private int id;
    //货物名称
    private String name;
    //货物重量(t)
    private double weight;
    //货物种类id
    private int typeid;
    //港口id
    private int harbourid;
    //用户id
    private int userid;
    //货物入库时间(yyyy年MM月dd日HH:mm:ss)
    private Date intime;
    //货物状态(1--申请中(提交申请)，2--待入库(申请成功)，3--在库中，4--准备出库, 5--已出库)
    private int state;

    //构造函数
    public Cargo() {
    }

    public Cargo(int id, String name, double weight, int typeid, int harbourid, int userid, Date intime, int state) {
        this.id=id;
        this.name = name;
        this.weight = weight;
        this.typeid = typeid;
        this.harbourid = harbourid;
        this.userid = userid;
        this.intime = intime;
        this.state = state;
    }

    //getter&setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public int getTypeid() {
        return typeid;
    }

    public void setTypeid(int typeid) {
        this.typeid = typeid;
    }

    public int getHarbourid() {
        return harbourid;
    }

    public void setHarbourid(int harbourid) {
        this.harbourid = harbourid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public Date getIntime() {
        return intime;
    }

    public void setIntime(Date intime) {
        this.intime = intime;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Cargo{" +
                "id='" + id + '\'' +
                "name='" + name + '\'' +
                ", weight=" + weight +
                ", typeid=" + typeid +
                ", harbourid=" + harbourid +
                ", userid=" + userid +
                ", intime=" + intime +
                ", state=" + state +
                '}';
    }
}
