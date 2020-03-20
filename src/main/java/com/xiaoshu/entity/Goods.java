package com.xiaoshu.entity;

import java.io.Serializable;
import javax.persistence.*;

public class Goods implements Serializable {
    @Id
    private Integer id;

    private String name;

    private Long price;

    private String info;

    private String typenum;

    private static final long serialVersionUID = 1L;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * @return price
     */
    public Long getPrice() {
        return price;
    }

    /**
     * @param price
     */
    public void setPrice(Long price) {
        this.price = price;
    }

    /**
     * @return info
     */
    public String getInfo() {
        return info;
    }

    /**
     * @param info
     */
    public void setInfo(String info) {
        this.info = info == null ? null : info.trim();
    }

    /**
     * @return typenum
     */
    public String getTypenum() {
        return typenum;
    }

    /**
     * @param typenum
     */
    public void setTypenum(String typenum) {
        this.typenum = typenum == null ? null : typenum.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", price=").append(price);
        sb.append(", info=").append(info);
        sb.append(", typenum=").append(typenum);
        sb.append("]");
        return sb.toString();
    }

	public Goods() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Goods(Integer id, String name, Long price, String info, String typenum) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.info = info;
		this.typenum = typenum;
	}
     
}