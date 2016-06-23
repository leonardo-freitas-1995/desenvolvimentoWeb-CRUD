package br.inf.ufg.crud.dao;

import br.inf.ufg.crud.db.DatabaseConnection;
import br.inf.ufg.crud.entity.Item;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import java.util.ArrayList;
import org.bson.Document;
import org.bson.types.ObjectId;

public class ItemDAO {

    private static ItemDAO instance = null;
    private final MongoDatabase mongoDatabase;
    private final MongoCollection<Document> collection;

    private ItemDAO() {
        this.mongoDatabase = DatabaseConnection.create();
        this.collection = this.mongoDatabase.getCollection("items");
    }

    public static synchronized ItemDAO getInstance() {
        if (instance == null) {
            instance = new ItemDAO();
        }
        return instance;
    }

    public void save(Item item) {
        Document itemDB = new Document("name", item.getName())
                .append("count", item.getCount())
                .append("price", item.getPrice());
        this.collection.insertOne(itemDB);
    }

    public Item getOne(String _id) {
        Document query = new Document("_id",  new ObjectId(_id));
        Document search = collection.find(query).first();
        if (search == null) {
            return null;
        }

        Item item = new Item(search.getString("name"),
                search.getInteger("count"),
                search.getDouble("price"));
        item.setId(search.getObjectId("_id").toString());
        return item;
    }

    public ArrayList<Item> getAll() {
        ArrayList<Item> activityList = new ArrayList<>();
        Document query = new Document();
        FindIterable<Document> search = collection.find(query);
        if (search == null) {
            return null;
        }
        for (Document current : search) {
            Item activity = new Item(current.getString("name"),
                    current.getInteger("count"),
                    current.getDouble("price"));
            activity.setId(current.getObjectId("_id").toString());
            activityList.add(activity);
        }
        return activityList;
    }

    public void delete(String _id) {
        Document query = new Document("_id",  new ObjectId(_id));
        collection.deleteOne(query);
    }

    public void update(String _id, Item item) {
        Document query = new Document("_id", new ObjectId(_id));
        Document itemDB = new Document("name", item.getName())
                .append("count", item.getCount())
                .append("price", item.getPrice());
        collection.updateOne(query, new Document("$set", itemDB));
    }

}
