package com.sh.airbnb.room.model.service;

import static com.sh.airbnb.common.JdbcTemplate.*;
import java.sql.Connection;
import java.util.List;

import com.sh.airbnb.room.model.dao.RoomDao;
import com.sh.airbnb.room.model.dto.Room;

public class RoomService {
	
	private RoomDao roomDao = new RoomDao();

	public List<Room> roomTotalView(String hotelNo) {
		Connection conn = getConnection();
		List<Room> roomList = roomDao.roomTotalView(conn,hotelNo);
		close(conn);
		return roomList;
	}

}
