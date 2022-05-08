import UIKit

class LaundryTableViewCell: UITableViewCell {

    @IBOutlet weak var LaundryContainerView: UIView! {
        didSet {
            LaundryContainerView.layer.cornerRadius = 10
            LaundryContainerView.layer.shadowOpacity = 0.3
            LaundryContainerView.layer.shadowRadius = 2
            LaundryContainerView.layer.shadowOffset = CGSize(width: 1, height: 1)
        }
    }
    
    @IBOutlet weak var LaundryClippingView: UIView! {
        didSet {
            LaundryClippingView.layer.cornerRadius = 10
            LaundryClippingView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var LaundryName: UILabel!
    @IBOutlet weak var LaundryTime: UILabel!
    @IBOutlet weak var LaundryStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
