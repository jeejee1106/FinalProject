package data.project;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("pdto")
public class ProjectDTO {
	
	private int idx;
	private String name;
	private String category;
	private String title;
	private String thumbnail;
	private int target_amount;
	private Timestamp start_date;
	private Timestamp end_date;
	private Timestamp time_start;
	private String project_goal;
	private String project_budget;
	private String project_schedule;
	private String project_team_intro;
	private String project_present_intro;
	private String anticipated_problem;
	private String exchange_refund;
	private int number_support;
	private int total_amount;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getTarget_amount() {
		return target_amount;
	}
	public void setTarget_amount(int target_amount) {
		this.target_amount = target_amount;
	}
	public Timestamp getStart_date() {
		return start_date;
	}
	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}
	public Timestamp getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Timestamp end_date) {
		this.end_date = end_date;
	}
	public Timestamp getTime_start() {
		return time_start;
	}
	public void setTime_start(Timestamp time_start) {
		this.time_start = time_start;
	}
	public String getProject_goal() {
		return project_goal;
	}
	public void setProject_goal(String project_goal) {
		this.project_goal = project_goal;
	}
	public String getProject_budget() {
		return project_budget;
	}
	public void setProject_budget(String project_budget) {
		this.project_budget = project_budget;
	}
	public String getProject_schedule() {
		return project_schedule;
	}
	public void setProject_schedule(String project_schedule) {
		this.project_schedule = project_schedule;
	}
	public String getProject_team_intro() {
		return project_team_intro;
	}
	public void setProject_team_intro(String project_team_intro) {
		this.project_team_intro = project_team_intro;
	}
	public String getProject_present_intro() {
		return project_present_intro;
	}
	public void setProject_present_intro(String project_present_intro) {
		this.project_present_intro = project_present_intro;
	}
	public String getAnticipated_problem() {
		return anticipated_problem;
	}
	public void setAnticipated_problem(String anticipated_problem) {
		this.anticipated_problem = anticipated_problem;
	}
	public String getExchange_refund() {
		return exchange_refund;
	}
	public void setExchange_refund(String exchange_refund) {
		this.exchange_refund = exchange_refund;
	}
	public int getNumber_support() {
		return number_support;
	}
	public void setNumber_support(int number_support) {
		this.number_support = number_support;
	}
	public int getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	
	
}
