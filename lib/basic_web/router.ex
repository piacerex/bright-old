defmodule BasicWeb.Router do
  use BasicWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {BasicWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BasicWeb do
    pipe_through :browser

    get "/", PageController, :index

    live "/exam_choices", ExamChoiceLive.Index, :index
    live "/exam_choices/new", ExamChoiceLive.Index, :new
    live "/exam_choices/:id/edit", ExamChoiceLive.Index, :edit

    live "/exam_choices/:id", ExamChoiceLive.Show, :show
    live "/exam_choices/:id/show/edit", ExamChoiceLive.Show, :edit

    live "/skills", SkillLive.Index, :index
    live "/skills/new", SkillLive.Index, :new
    live "/skills/:id/edit", SkillLive.Index, :edit

    live "/skills/:id", SkillLive.Show, :show
    live "/skills/:id/show/edit", SkillLive.Show, :edit

    live "/exam_choice_results", ExamChoiceResultLive.Index, :index
    live "/exam_choice_results/new", ExamChoiceResultLive.Index, :new
    live "/exam_choice_results/:id/edit", ExamChoiceResultLive.Index, :edit

    live "/exam_choice_results/:id", ExamChoiceResultLive.Show, :show
    live "/exam_choice_results/:id/show/edit", ExamChoiceResultLive.Show, :edit

    live "/owned_skills", OwnedSkillLive.Index, :index
    live "/owned_skills/new", OwnedSkillLive.Index, :new
    live "/owned_skills/:id/edit", OwnedSkillLive.Index, :edit

    live "/owned_skills/:id", OwnedSkillLive.Show, :show
    live "/owned_skills/:id/show/edit", OwnedSkillLive.Show, :edit

    live "/last_sheet_assesments_tss", LastSheetAssesmentsTSLive.Index, :index
    live "/last_sheet_assesments_tss/new", LastSheetAssesmentsTSLive.Index, :new
    live "/last_sheet_assesments_tss/:id/edit", LastSheetAssesmentsTSLive.Index, :edit

    live "/last_sheet_assesments_tss/:id", LastSheetAssesmentsTSLive.Show, :show
    live "/last_sheet_assesments_tss/:id/show/edit", LastSheetAssesmentsTSLive.Show, :edit

    live "/sheets", SheetLive.Index, :index
    live "/sheets/new", SheetLive.Index, :new
    live "/sheets/:id/edit", SheetLive.Index, :edit

    live "/sheets/:id", SheetLive.Show, :show
    live "/sheets/:id/show/edit", SheetLive.Show, :edit

    live "/sheet_skills", SheetSkillLive.Index, :index
    live "/sheet_skills/new", SheetSkillLive.Index, :new
    live "/sheet_skills/:id/edit", SheetSkillLive.Index, :edit

    live "/sheet_skills/:id", SheetSkillLive.Show, :show
    live "/sheet_skills/:id/show/edit", SheetSkillLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", BasicWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: BasicWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
