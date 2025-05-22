export interface IFarmerTransactionHistory
{
  transactionID: string;
  cropName: string;
  quantityRequested: number;
  offeredPrice?: number;
  totalAmount?: number;
  requestDate?: Date;
  userID?: string;
  fullName: string;
  status: string;
}
