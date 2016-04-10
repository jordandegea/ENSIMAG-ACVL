package model;

import dao.DAOException;
import loaders.BiographieLoader;
import loaders.PartieLoader;

import java.sql.Date;

/**
 * Created by william on 05/04/16.
 */
public class ResumePartieModel extends EpisodeModel {
    private PartieLoader partie;

    public ResumePartieModel(int id, Date date, boolean ecritureEnCours) {
        super(id, date, ecritureEnCours);
        
        partie = new PartieLoader();
    }

    public PartieModel getPartie() throws DAOException {
        return partie.get(this);
    }

}
