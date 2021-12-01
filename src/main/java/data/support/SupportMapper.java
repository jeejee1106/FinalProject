package data.support;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SupportMapper {

	public void insertSupportData(SupportDTO dto);
	public void addSupporter(int idx);
	public void addTotalAmount(int idx);
	public void addSupportProject(HashMap<String, Object> map);
	public String getEmail(String id);
}
