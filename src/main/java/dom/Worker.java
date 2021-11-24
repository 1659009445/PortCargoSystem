package dom;

/**
 * 管理员&工人
 */
public class Worker {
    //用户编号
    private int id;
    //用户种类(1--管理员, 2--普通工人)
    private int typeid;
    //用户名
    private String username;
    //密码
    private String password;
    //电话
    private String phone;
    //邮箱
    private String email;
    //港口(普通工人对应工作港口)
    private int harbourid;

    //构造函数
    public Worker() {
    }

    public Worker(int id, int typeid, String username, String password, String phone, String email, int harbourid) {
        this.id = id;
        this.typeid = typeid;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.harbourid = harbourid;
    }

    //getter&setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTypeid() {
        return typeid;
    }

    public void setTypeid(int typeid) {
        this.typeid = typeid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getHarbourid() {
        return harbourid;
    }

    public void setHarbourid(int harbourid) {
        this.harbourid = harbourid;
    }

    @Override
    public String toString() {
        return "Worker{" +
                "id=" + id +
                ", typeid=" + typeid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", harbourid=" + harbourid +
                '}';
    }
}
