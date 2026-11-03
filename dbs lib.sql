
CREATE TABLE library_publisher (
    publisher_id NUMBER(10) PRIMARY KEY,
    name VARCHAR2(50),
    address VARCHAR2(100)
);

CREATE TABLE library_book (
    book_id NUMBER(10) PRIMARY KEY,
    title VARCHAR2(100),
    author VARCHAR2(50),
    price NUMBER(10,2),
    available VARCHAR2(10),
    publisher_id NUMBER(10),
    FOREIGN KEY (publisher_id)
    REFERENCES library_publisher(publisher_id)
);

CREATE TABLE library_member (
    member_id NUMBER(10) PRIMARY KEY,
    name VARCHAR2(50),
    address VARCHAR2(100)
);


CREATE TABLE library_borrow (
    book_id NUMBER(10),
    member_id NUMBER(10),
    issue_date DATE,
    due_date DATE,
    return_date DATE,
    PRIMARY KEY (book_id, member_id, issue_date),
    FOREIGN KEY (book_id)
    REFERENCES library_book(book_id),
    FOREIGN KEY (member_id)
    REFERENCES library_member(member_id)
);




INSERT INTO library_publisher VALUES (101, 'Pearson', 'Delhi');
INSERT INTO library_publisher VALUES (102, 'McGraw Hill', 'Mumbai');
INSERT INTO library_publisher VALUES (103, 'Oxford Press', 'Kolkata');




INSERT INTO library_book VALUES (1, 'DBMS', 'Korth', 550, 'Yes', 101);
INSERT INTO library_book VALUES (2, 'Operating System', 'Galvin', 650, 'Yes', 102);
INSERT INTO library_book VALUES (3, 'Computer Networks', 'Tanenbaum', 700, 'No', 103);
INSERT INTO library_book VALUES (4, 'C Programming', 'Dennis Ritchie', 400, 'Yes', 101);
INSERT INTO library_book VALUES (5, 'Data Structures', 'Seymour Lipschutz', 500, 'Yes', 102);




INSERT INTO library_member VALUES (201, 'thor 'Ghaziabad');
INSERT INTO library_member VALUES (202, 'Rahul', 'Delhi');
INSERT INTO library_member VALUES (203, 'Aman', 'Noida');
INSERT INTO library_member VALUES (204, 'Rohit', 'Meerut');
INSERT INTO library_member VALUES (205, 'Priya', 'Lucknow');



INSERT INTO library_borrow VALUES (1, 201, TO_DATE('01-10-2026','DD-MM-YYYY'), TO_DATE('15-10-2026','DD-MM-YYYY'), NULL);
INSERT INTO library_borrow VALUES (2, 202, TO_DATE('03-10-2026','DD-MM-YYYY'), TO_DATE('17-10-2026','DD-MM-YYYY'), NULL);
INSERT INTO library_borrow VALUES (3, 203, TO_DATE('05-10-2026','DD-MM-YYYY'), TO_DATE('19-10-2026','DD-MM-YYYY'), TO_DATE('15-10-2026','DD-MM-YYYY'));
INSERT INTO library_borrow VALUES (4, 204, TO_DATE('07-10-2026','DD-MM-YYYY'), TO_DATE('21-10-2026','DD-MM-YYYY'), NULL);
INSERT INTO library_borrow VALUES (5, 205, TO_DATE('09-10-2026','DD-MM-YYYY'), TO_DATE('23-10-2026','DD-MM-YYYY'), NULL);


COMMIT;



SELECT * FROM library_publisher;
SELECT * FROM library_book;
SELECT * FROM library_member;
SELECT * FROM library_borrow;
