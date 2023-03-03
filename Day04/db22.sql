CREATE TABLE prodtbl(
	prodCode CHAR(3) NOT NULL,
    prodID CHAR(4) NOT NULL,
    prodDate DATETIME NOT NULL,
    prodCur VARCHAR(10) NULL,
    CONSTRAINT pr_prodtbl_prodCode_prodId
		PRIMARY KEY(prodCode, prodID)
);