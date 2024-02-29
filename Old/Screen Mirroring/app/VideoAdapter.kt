class VideoAdapter(private val videoList: List<String>) :
    RecyclerView.Adapter<VideoAdapter.VideoViewHolder>() {

    class VideoViewHolder(private val binding: ItemVideoBinding) :
        RecyclerView.ViewHolder(binding.root) {
        val videoView: VideoView = binding.videoView
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): VideoViewHolder {
        val itemBinding = ItemVideoBinding.inflate(LayoutInflater.from(parent.context), parent, false)
        return VideoViewHolder(itemBinding)
    }

    override fun onBindViewHolder(holder: VideoViewHolder, position: Int) {
        val videoPath = videoList[position]
        holder.videoView.setVideoPath(videoPath)
        holder.videoView.setOnPreparedListener { mp -> mp.isLooping = true }

        // Set OnClickListener to open video in external player
        holder.videoView.setOnClickListener {
            openVideoInExternalPlayer(holder.videoView.context, videoPath)
        }

        holder.videoView.start()
    }

    override fun getItemCount(): Int {
        return videoList.size
    }

    private fun openVideoInExternalPlayer(context: Context, videoPath: String) {
        val intent = Intent(Intent.ACTION_VIEW)
        intent.setDataAndType(Uri.parse(videoPath), "video/*")
        context.startActivity(intent)
    }
}