package app2.example.hp.com.myapplication;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RatingBar;
import android.widget.TextView;

import com.android.volley.VolleyError;
import com.android.volley.toolbox.ImageLoader;

import java.util.ArrayList;

/**
 * Created by SIDDHARTH on 1/12/2016.
 */
public class AdapterBoxOffice extends RecyclerView.Adapter<AdapterBoxOffice.ViewHolderBoxOffice> {
    VolleySingelton volleySingelton;
    private ImageLoader imageLoader;
    private ArrayList<Movies> listMovies = new ArrayList<>();
    private LayoutInflater layoutInflater;

    public AdapterBoxOffice(Context context) {
        layoutInflater = LayoutInflater.from(context);
        volleySingelton = VolleySingelton.getsInstance();
        imageLoader = volleySingelton.getImageLoader();
    }

    public void setmoviesList(ArrayList<Movies> listMovies) {
        this.listMovies= listMovies;
        notifyItemRangeChanged(0, listMovies.size());
    }


    @Override
    public ViewHolderBoxOffice onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = layoutInflater.inflate(R.layout.coustum_movie_layout, parent, false);
        ViewHolderBoxOffice viewHolder = new ViewHolderBoxOffice(view);
        return viewHolder;
    }

    @Override
    public void onBindViewHolder(final ViewHolderBoxOffice holder, int position) {
        Movies currentMovie = listMovies.get(position);
        holder.movieTitle.setText(currentMovie.getTitle());
        holder.movieReleaseDate.setText(currentMovie.getReleaseDateTheater().toString());
        holder.movieAudienceScore.setRating(currentMovie.getAudienceScore() / 20F);
        String urlThumbnail = currentMovie.getUrlThumbnail();
        if (urlThumbnail != null) {
            imageLoader.get(urlThumbnail, new ImageLoader.ImageListener() {
                @Override
                public void onResponse(ImageLoader.ImageContainer response, boolean isImmediate) {
                    holder.movieThumbnail.setImageBitmap(response.getBitmap());
                }

                @Override
                public void onErrorResponse(VolleyError error) {

                }
            });
        }
    }
    @Override
    public int getItemCount() {
        return listMovies.size();
    }
    static class ViewHolderBoxOffice extends RecyclerView.ViewHolder {
        private ImageView movieThumbnail;
        private TextView movieTitle;
        private TextView movieReleaseDate;
        private RatingBar movieAudienceScore;
        private View scroller;

        public ViewHolderBoxOffice(View itemView) {
            super(itemView);
            movieThumbnail = (ImageView) itemView.findViewById(R.id.movieThumbnail);
            movieTitle = (TextView) itemView.findViewById(R.id.movieTitle);
            movieReleaseDate = (TextView) itemView.findViewById(R.id.movieReleaseDate);
            movieAudienceScore = (RatingBar) itemView.findViewById(R.id.movieAudienceScore);
        itemView.setVerticalScrollBarEnabled(true);
            itemView.setScrollContainer(true);
        }
    }
}
