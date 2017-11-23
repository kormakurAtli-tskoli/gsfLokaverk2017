/*SP1 START*/
CREATE TABLE PRICE(
	PRICE_CODE DECIMAL(2,0) PRIMARY KEY,
	PRICE_DESCRIPTION VARCHAR(20) NOT NULL,
	PRICE_RENTFEE DECIMAL(5,2) CHECK(PRICE_RENTFEE >= 0),
	PRICE_DAILYATEFEE DECIMAL(5,2) CHECK(PRICE_DAILYATEFEE >= 0)
);
CREATE TABLE MOVIE(
	MOVIE_NUM INT(8) PRIMARY KEY,
	MOVIE_TITLE VARCHAR(55) NOT NULL,
	MOVIE_YEAR INT(4) CHECK(MOVIE_YEAR >= 1900),
	MOVIE_COST DECIMAL(5,2),
	MOVIE_GENRE VARCHAR(55),
	PRICE_CODE DECIMAL(2,0) CONSTRAINT VIDEO_MOVIE_NUM_FK REFERENCES MOVIE
);
CREATE TABLE VIDEO(
	VID_NUM DECIMAL(8,0) PRIMARY KEY,
	VID_INDATE DATE,
	MOVIE_NUM DECIMAL(2,0) CONSTRAINT VIDEO_MOVIE_NUM_FK REFERENCES MOVIE
);
CREATE TABLE MEMBERSHIP(
	MEM_NUM DECIMAL(8,0) PRIMARY KEY,
	MEM_FNAME VARCHAR(55) NOT NULL,
	MEM_LNAME VARCHAR(55) NOT NULL,
	MEM_STREET VARCHAR(175) NOT NULL,
	MEM_CITY VARCHAR(50),
	MEM_STATE CHAR(2),
	MEM_ZIP CHAR(5),
	MEM_BALANCE DECIMAL(10,2)
);
CREATE TABLE RENTAL(
	RENT_NUM DECIMAL(8,0),
	REN_DATE DATE,
	MEM_NUM DECIMAL(8,0) CONSTRAINT RENTAL_MEM_NUM_FK REFERENCES MEMBERSHIP
);
CREATE TABLE DETAILRENTAL(
	RENT_NUM DECIMAL(8,0) CONSTRAINT DETAIL_RENT_NUM_FK REFERENCES RENTAL,
	VID_NUM DECIMAL(8,0) CONSTRAINT DETAIL_VID_NUM_FK REFERENCES VIDEO,
	DETAIL_FEE DECIMAL(5,2),
	DETAIL_DUEDATE DATE,
	DETAIL_RETURNDATE DATE,
	DETAIL_DAILYATEFEE DECIMAL(5,2),
	CONSTRAINT DETAIL_RENT_VID_PK PRIMARY KEY (RENT_NUM,VID_NUM)
);
/*SP1 END*/