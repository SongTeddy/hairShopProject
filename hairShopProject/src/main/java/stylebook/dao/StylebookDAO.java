package stylebook.dao;

import java.util.List;
import java.util.Map;

public interface StylebookDAO {
	public List<Map<String,String>> getPermImage(String perm);
	public List<Map<String, String>> getCutImage(String cut);
	public List<Map<String, String>> getStyleImage(String style);
	public List<Map<String, String>> getDyeImage(String dyeing);
}
