package dom;

/**
 * 港口
 */
public class Harbour {
    //港口编号
    private int id;
    //港口名称
    private String name;
    //港口最大容量
    private double capacity;
    //港口是否满载
    private boolean isfull;

    //构造函数
    public Harbour() {
    }

    public Harbour(int id, String name, double capacity, boolean isfull) {
        this.id = id;
        this.name = name;
        this.capacity = capacity;
        this.isfull = isfull;
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

    public double getCapacity() {
        return capacity;
    }

    public void setCapacity(double capacity) {
        this.capacity = capacity;
    }

    public boolean isIsfull() {
        return isfull;
    }

    public void setIsfull(boolean isfull) {
        this.isfull = isfull;
    }

    @Override
    public String toString() {
        return "Harbour{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", capacity=" + capacity +
                ", isfull=" + isfull +
                '}';
    }
}
