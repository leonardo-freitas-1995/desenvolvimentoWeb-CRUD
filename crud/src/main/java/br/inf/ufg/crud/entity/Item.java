package br.inf.ufg.crud.entity;

public class Item {

    private String _id;
    private String name;
    private int count;
    private double price;

    public Item(String name, int count, double price) {
        this.name = name;
        this.count = count;
        this.price = price;
    }

    public String getId() {
        return _id;
    }

    public void setId(String _id) {
        this._id = _id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    
    
}
