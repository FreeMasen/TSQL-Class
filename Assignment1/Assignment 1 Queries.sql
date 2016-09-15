Use AP


/*
Assignment 1, question 1
From the Invoices table, find the VendorIds which have an 
InvoiceNumber beginning with ‘P’. 
Show two columns VendorId and InvoiceNumber.
*/
Select VendorId, InvoiceNumber
From Invoices
Where InvoiceNumber like 'P%'

/*
Assignment 1, question 2
From the Vendors table, list the 
distinct VendorStates except for California.
*/
Select distinct VendorState
From Vendors
Where VendorState != 'CA'

/*
Assignment 1, question 3
Join the tables Invoices and InvoiceLineItems. 
Find InvoiceLineItemAmounts which are greater 
than 100. Display the InvoiceNumbers and 
InvoiceLineItemAmounts. Order the Amounts in a Desc order.
*/
Select InvoiceNumber, InvoiceLineItemAmount
From Invoices
	join InvoiceLineItems
	on Invoices.InvoiceId = InvoiceLineItems.InvoiceId
Where InvoiceLineItemAmount > 100
Order By InvoiceLineItemAmount desc

/*
Assignment 1, question 4
Join the tables GLAccounts and InvoiceLineItems. 
Select the columns AccountNo and AccountDescription 
where the AccountNo is in GLAccounts but not the 
InvoiceLineItems table. Use a Left Join.
*/
Select *
From GLAccounts
	left join InvoiceLineItems
	On InvoiceLineItems.AccountNo = GLAccounts.AccountNo
Where InvoiceLineItems.AccountNo is not null

/*
Assignment 1, question 5
Describe why a Right Outer join is unnecessary.
*/

/*
A Right Outer Join is unnecessary because it accomplishes
the same thing as reversing the tables listed in your
From statement and performing a Left Outer Join (which is
more common and/or seen as the default outer join).
*/