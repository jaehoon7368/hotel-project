package com.sh.airbnb.room.model.service;

import static com.sh.airbnb.common.JdbcTemplate.*;
import java.sql.Connection;
import java.sql.Date;
import java.util.List;

import com.sh.airbnb.room.model.dao.RoomDao;
import com.sh.airbnb.room.model.dto.Room;
import com.sh.airbnb.room.model.dto.RoomPrice;

public class RoomService {
	
	private RoomDao roomDao = new RoomDao();

	public List<Room> roomTotalView(String hotelNo) {
		Connection conn = getConnection();
		List<Room> roomList = roomDao.roomTotalView(conn,hotelNo);
		close(conn);
		return roomList;
	}

	public RoomPrice selectRoomPrice() {
		Connection conn = getConnection();
		RoomPrice roomPrice = roomDao.selectRoomPrice(conn);
		close(conn);
		return roomPrice;
	}

	public List<Room> selectRoomDateView(String hotelNo, Date sqlDate1, Date sqlDate2) {
		Connection conn = getConnection();
		
		List<Room> roomDateList = roomDao.roomselectDate(conn,hotelNo,sqlDate1,sqlDate2);
		List<Room> roomList = roomDao.selectCheckRoom(conn,roomDateList);
		close(conn);
		
		return roomList;
	}


}
