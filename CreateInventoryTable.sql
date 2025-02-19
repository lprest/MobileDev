CREATE TABLE Inventory (
	InventoryID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	TeaID INT NOT NULL,
	SupplierID INT NOT NULL,
	Quantity INT NOT NULL,
	FOREIGN KEY (TeaID) REFERENCES Tea(TeaID) ON DELETE CASCADE,
	FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID) ON DELETE CASCADE
);