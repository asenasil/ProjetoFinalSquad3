
import UIKit

public class DetalhesMoeda: UIView {
    
    var listaFavoritos: [String] = []
   
    
    @IBOutlet weak var imagemFavoritos: UIImageView!
    
    @IBOutlet weak var imagemMoeda: UIImageView!
    
    @IBOutlet weak var valorMoedaLabel: UILabel!
    
    @IBOutlet weak var botaoAdcionarRemoverOutlet: UIButton!
    
    @IBOutlet weak var valorHoraLabel: UILabel!
    
    @IBOutlet weak var valorMesLabel: UILabel!
    
    @IBOutlet weak var valorAnoLabel: UILabel!
    

    
    
    
    
    @IBAction func botaoAcao(_ sender: UIButton) {
        
        // se moeda está em listaFavoritos -> Remove
        // senão -> Adiciona
        
    }
    
    
}


public extension UIView {
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
}
