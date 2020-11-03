package databasetojava;

public class DisplayInfo {
	private String Prod_Name;
	private String Prod_Description;
	private int Prod_Price;
	private String Category_Name;
	private int Loc_ID;
	private int Item_Condition_ID;
	public String getProd_Name() {
		return Prod_Name;
	}
	public void setProd_Name(String prod_Name) {
		Prod_Name = prod_Name;
	}
	public String getProd_Description() {
		return Prod_Description;
	}
	public void setProd_Description(String prod_Description) {
		Prod_Description = prod_Description;
	}
	public int getProd_Price() {
		return Prod_Price;
	}
	public void setProd_Price(int prod_Price) {
		Prod_Price = prod_Price;
	}
	public String getCategory_Name() {
		return Category_Name;
	}
	public void setCategory_Name(String category_Name) {
		Category_Name = category_Name;
	}
	public int getLoc_ID() {
		return Loc_ID;
	}
	public void setLoc_ID(int loc_ID) {
		Loc_ID = loc_ID;
	}
	public int getItem_Condition_ID() {
		return Item_Condition_ID;
	}
	public void setItem_Condition_ID(int item_Condition_ID) {
		Item_Condition_ID = item_Condition_ID;
	}

@Override
	
	
public String toString() {
		
		
		
		
		
	return "[Prod_Name=" + Prod_Name + ", Prod_Description=" + Prod_Description + ", Prod_Price="
			+ Prod_Price + ", Category_Name=" + Category_Name + ", Loc_ID=" + Loc_ID + ", Item_Condition_ID="
	+ Item_Condition_ID + "]";
	}
	
	

}
