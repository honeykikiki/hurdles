import BottomNavBar from "./BottomNavbar";
import Spacing from "./Spacing";
import TopNavbar from "./TopNavbar";

interface FrameProps {
  title: string;
  children: React.ReactNode;
  bBottomNav?: boolean;
  bAlert?: boolean;
  bBackButton?: boolean;
  backButtonClick?: () => void;
  isLoading?: boolean;
}

function Frame({
  children,
  title,
  bBottomNav = false,
  bBackButton = true,
  bAlert = false,
  backButtonClick,
}: FrameProps) {
  return (
    <>
      <TopNavbar
        title={title}
        bBackButton={bBackButton}
        backButtonClick={backButtonClick}
        bAlert={bAlert}
      />

      {children}
      {bBottomNav && (
        <>
          <Spacing size={100} />
          <BottomNavBar />
        </>
      )}
    </>
  );
}

export default Frame;
