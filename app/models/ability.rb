class Ability
  include CanCan::Ability

  def initialize(user)
      
       user ||= User.new # guest user (not logged in)

       if user.role? :admin_role
           can :manage, :all
       elsif user.role? :customer_role
           can :read, :all               #[Booking, Car, Issue]
     #      can :create, [Customer, Booking, Car]
           #can :update, [Booking, Car]
           #can :destroy,[Booking, Car]
     #      can :manage, Booking do |booking|
     #          booking.try(:customer) == user
     #      end
     #      can :manage, Car do |car|
     #          car.try(:customer) == user
     #      end
       elsif user.role? :mechanic_role
           can :read, [Mechanic,Booking]
           
     #      can :manage, Booking do |booking|
     #          booking.try(:mechanic) == user
     #      end
       elsif user.role? :manufacturer_role
           can :read, [Manufacturer, Model]
     #      can :manage, Model do |model|
     #          model.try(:manufacturer) == user
     #      end
      end

    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end


end
