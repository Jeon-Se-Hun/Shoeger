package aaa.model;

import java.util.Date;

import lombok.Data;

@Data
public class VisitorDTO {
	String visit_id, visit_ip, visit_agent, visit_refer;
	Date visit_time;
}
