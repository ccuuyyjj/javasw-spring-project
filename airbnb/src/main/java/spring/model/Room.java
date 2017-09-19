package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Room {
	private int no;
	private String name;
	private String type;
	private String photoUrl;
	private String region;
	private double lat;
	private double lng;
	private String address;
	private int capacity;
	private int beds;
	private int bedrooms;
	private String shared;
	private String bed_type;
	private String owner_id;
	private String etc;
	private int read;
	private String reg;
	private int progress;
	private String options;
	private int price;

	public Room() {
	}

	public Room(String name, String type, String photoUrl, String region, double lat, double lng, String address,
			int capacity, int beds, int bathrooms, String shared, String bed_type, String owner_id, String etc,
			int progress, String options) {
		this.name = name;
		this.type = type;
		this.photoUrl = photoUrl;
		this.region = region;
		this.lat = lat;
		this.lng = lng;
		this.address = address;
		this.capacity = capacity;
		this.beds = beds;
		this.bedrooms = bathrooms;
		this.shared = shared;
		this.bed_type = bed_type;
		this.owner_id = owner_id;
		this.etc = etc;
		this.progress = progress;
		this.options = options;
	}

	public Room(ResultSet rs) throws SQLException {
		this.no = rs.getInt("no");
		this.name = rs.getString("name");
		this.type = rs.getString("type");
		this.photoUrl = rs.getString("photoUrl");
		this.region = rs.getString("region");
		this.lat = rs.getDouble("lat");
		this.lng = rs.getDouble("lng");
		this.address = rs.getString("address");
		this.capacity = rs.getInt("capacity");
		this.beds = rs.getInt("beds");
		this.bedrooms = rs.getInt("bedrooms");
		this.shared = rs.getString("shared");
		this.bed_type = rs.getString("bed_type");
		this.owner_id = rs.getString("owner_id");
		this.etc = rs.getString("etc");
		this.read = rs.getInt("read");
		this.reg = rs.getString("reg");
		this.progress = rs.getInt("progress");
		this.options = rs.getString("options");
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getBeds() {
		return beds;
	}

	public void setBeds(int beds) {
		this.beds = beds;
	}

	public int getBedrooms() {
		return bedrooms;
	}

	public void setBedrooms(int bedrooms) {
		this.bedrooms = bedrooms;
	}

	public String getShared() {
		return shared;
	}

	public void setShared(String shared) {
		this.shared = shared;
	}

	public String getBed_type() {
		return bed_type;
	}

	public void setBed_type(String bed_type) {
		this.bed_type = bed_type;
	}

	public String getOwner_id() {
		return owner_id;
	}

	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}

	public String getEtc() {
		return etc;
	}

	public String getEtcHtml() {
		return etc.replace("\n", "<br>");
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public int getRead() {
		return read;
	}

	public void setRead(int read) {
		this.read = read;
	}

	public String getReg() {
		return reg;
	}

	public String getDate() {
		return reg.substring(0, 10);
	}

	public void setReg(String reg) {
		this.reg = reg;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

	public String getOptions() {
		return options;
	}

	public String[] getParsedOptions() {
		if(options != null)
			return options.split("|");
		else return null;
	}

	public void setParsedOptions(String[] parsedOptions) {
		StringBuilder options = new StringBuilder();
		for (String option : parsedOptions) {
			if (options.length() > 0)
				options.append("|");
			options.append(option);
		}
		this.options = options.toString();
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Room [no=" + no + ", name=" + name + ", type=" + type + ", photoUrl=" + photoUrl + ", region=" + region
				+ ", lat=" + lat + ", lng=" + lng + ", address=" + address + ", capacity=" + capacity + ", beds=" + beds
				+ ", bedrooms=" + bedrooms + ", shared=" + shared + ", bed_type=" + bed_type + ", owner_id=" + owner_id
				+ ", etc=" + etc + ", read=" + read + ", reg=" + reg + ", progress=" + progress + ", options=" + options
				+ ", price=" + price + "]";
	}
}
