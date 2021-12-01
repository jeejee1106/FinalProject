package data.project;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DetailMapper {

	public ProjectDTO getData(int idx);
	public String getPaymentDate(int idx);
	public String getEmail(String id);
	public String getPhonNumber(String id);
}
