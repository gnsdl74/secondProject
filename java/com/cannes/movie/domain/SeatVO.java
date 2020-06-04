package com.cannes.movie.domain;

public class SeatVO {
	private int seatNo;
	private int theaterNo;
	private String seatRow;
	private int seatColumn;
	private String seatActive;
	
	// 생성자
	public SeatVO() {}
	public SeatVO(int seatNo, int theaterNo, String seatRow, int seatColumn, String seatActive) {
		super();
		this.seatNo = seatNo;
		this.theaterNo = theaterNo;
		this.seatRow = seatRow;
		this.seatColumn = seatColumn;
		this.seatActive = seatActive;
	}
	// end 생성자
	
	// getter, setter
	public int getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}
	public int getTheaterNo() {
		return theaterNo;
	}
	public void setTheaterNo(int theaterNo) {
		this.theaterNo = theaterNo;
	}
	public String getSeatRow() {
		return seatRow;
	}
	public void setSeatRow(String seatRow) {
		this.seatRow = seatRow;
	}
	public int getSeatColumn() {
		return seatColumn;
	}
	public void setSeatColumn(int seatColumn) {
		this.seatColumn = seatColumn;
	}
	public String getSeatActive() {
		return seatActive;
	}
	public void setSeatActive(String seatActive) {
		this.seatActive = seatActive;
	}
	// end getter, setter
	
	@Override
	public String toString() {
		String str = "좌석 번호 : " + seatNo + "\n"
					+ "상영관 번호 : " + theaterNo + "\n"
					+ "좌석 행 : " + seatRow + "\n"
					+ "좌석 열 : " + seatColumn + "\n"
					+ "좌석 배정 유/무 : " + seatActive;
		return str;
	} // end toString()
	
} // end SeatVO
