//
//  TableViewCellSong.swift
//  MP3
//
//  Created by Бексултан Нурпейс on 27.12.2021.
//

import UIKit

class TableViewCellSong: UITableViewCell {

    @IBOutlet weak var lblSongTitle: UILabel!
    @IBOutlet weak var lblSongArtist: UILabel!
    @IBOutlet weak var imgSongBg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
