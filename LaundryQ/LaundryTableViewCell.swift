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
    
    @IBOutlet weak var CircleContainerView: UIView! {
        didSet {
            CircleContainerView.layer.cornerRadius = CircleContainerView.frame.size.width/2
            CircleContainerView.clipsToBounds = true
            CircleContainerView.layer.shadowOpacity = 0.3
            CircleContainerView.layer.shadowRadius = 2
            CircleContainerView.layer.shadowOffset = CGSize(width: 1, height: 1)
        }
    }
    
    @IBOutlet weak var CircleClippingView: UIView! {
        didSet {
            CircleClippingView.layer.cornerRadius = 10
            CircleClippingView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var LaundryName: UILabel!
    @IBOutlet weak var LaundryTime: UILabel!
    @IBOutlet weak var LaundryStatus: UILabel!
    @IBOutlet weak var LaundryItemCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
