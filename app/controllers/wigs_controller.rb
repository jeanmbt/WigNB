class WigsController < ApplicationController

  skip_before_action :authenticate_user!, only: :index

  def index
    # @wigs = Wig.all
    @wigs = policy_scope(Wig).order(created_at: :desc)

    # wig_urls = {
      #wigs: ["https://res.cloudinary.com/det3cfeuo/image/upload/v1611951779/122188981_381209123235477_6078118770236452520_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951778/83648363_153345072933573_1780315991930769335_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951777/120071059_322069665726364_6643220649883490748_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951776/ejxuatty7muz.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951775/118821937_1301871646654638_3649253308342502856_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951774/128147649_2732317226983359_8253060199056238589_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951773/141598262_732850230952028_1839645511739517442_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951770/140375754_172082167999419_3637993603317197526_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951769/104058028_888371534999764_2911223772971798150_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951768/121663677_357675018981276_3907510190854830877_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951767/136415408_1320229914999116_1095840898989377710_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951765/123943254_355998089011459_5982987040773507141_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951764/horns.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951763/130160179_110978374191987_7007545978336118191_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951762/136062878_150758336620787_1797297913793010095_n.jpg"]}
    # end

  end

  def new
    @wig = Wig.new
    authorize @wig
  end

  def create
    @wig = Wig.new(wig_params)
    @wig.save
  end
  
  private

  def wig_params
    params.require(:wig).permit(:name, :color, :description, :material, :style, :photo, :user_id, :created_at, :updated_at)
  end

  def days_ago
    Time.now - @wig.created_at
  end
  
end
