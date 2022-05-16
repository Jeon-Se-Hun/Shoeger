package aaa.model;

import java.util.Date;

import lombok.Data;

@Data
public class TradeDTO {
   String pid, kind, transport;
   Date adate;
   Integer point, price, tradeid, noid;
}