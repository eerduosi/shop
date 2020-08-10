package com.shop.entity;


public class Address {
    private Integer addressid;

    private Integer userid;

    private String receivername;

    private String receiverphone;

    private String receiveraddress;

    private String receiverzip;

    private String receivercreatetime;

    private String receiverupdatetime;
    
    private User user;

    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getReceivername() {
        return receivername;
    }

    public void setReceivername(String receivername) {
        this.receivername = receivername == null ? null : receivername.trim();
    }

    public String getReceiverphone() {
        return receiverphone;
    }

    public void setReceiverphone(String receiverphone) {
        this.receiverphone = receiverphone == null ? null : receiverphone.trim();
    }

    public String getReceiveraddress() {
        return receiveraddress;
    }

    public void setReceiveraddress(String receiveraddress) {
        this.receiveraddress = receiveraddress == null ? null : receiveraddress.trim();
    }

    public String getReceiverzip() {
        return receiverzip;
    }

    public void setReceiverzip(String receiverzip) {
        this.receiverzip = receiverzip == null ? null : receiverzip.trim();
    }

    public String getReceivercreatetime() {
        return receivercreatetime;
    }

    public void setReceivercreatetime(String receivercreatetime) {
        this.receivercreatetime = receivercreatetime;
    }

    public String getReceiverupdatetime() {
        return receiverupdatetime;
    }

    public void setReceiverupdatetime(String receiverupdatetime) {
        this.receiverupdatetime = receiverupdatetime;
    }
}