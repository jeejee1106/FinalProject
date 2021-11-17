package data.test;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestMapper {
	
	public void getAllMembers();
}
