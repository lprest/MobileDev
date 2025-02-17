SELECT 
    T.TeaID, 
    T.TeaName, 
    T.TeaType, 
    I.InventoryID, 
    I.Quantity, 
    S.SupplierName
FROM Tea T
LEFT JOIN Inventory I ON T.TeaID = I.TeaID
LEFT JOIN Supplier S ON I.SupplierID = S.SupplierID;