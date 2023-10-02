import { Outlet, NavLink, Link } from "react-router-dom";

// import github from "../../assets/github.svg";
import reti from "../../assets/logo_Reti.png";

import styles from "./Layout.module.css";

import { useLogin } from "../../authConfig"

import { LoginButton } from "../../components/LoginButton"

const Layout = () => {
    return (
        <div className={styles.layout}>
            <header className={styles.header} role={"banner"}>
                <div className={styles.headerContainer}>
                    <Link to="/" className={styles.headerTitleContainer}>
                        <h3 className={styles.headerTitle}>GPT + Enterprise data | Sample</h3>
                    </Link>
                    <nav>
                        <ul className={styles.headerNavList}>
                            <li>
                                <NavLink to="/" className={({ isActive }) => (isActive ? styles.headerNavPageLinkActive : styles.headerNavPageLink)}>
                                    Chat
                                </NavLink>
                            </li>
                            <li className={styles.headerNavLeftMargin}>
                                <NavLink to="/qa" className={({ isActive }) => (isActive ? styles.headerNavPageLinkActive : styles.headerNavPageLink)}>
                                    Ask a question
                                </NavLink>
                            </li>
                            <li className={styles.headerNavLeftMargin}>
                                <a href="https://www.reti.it" target={"_blank"} title="Reti S.p.A. link">
                                    <img
                                        src={reti}
                                        alt="Reti logo"
                                        aria-label="Link to Reti homepage"
                                        width="52px"
                                        height="30px"
                                        className={styles.githubLogo}
                                    />
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <h4 className={styles.headerRightText}>Azure OpenAI + Cognitive Search</h4>
                    {useLogin && <LoginButton/>}
                </div>
            </header>

            <Outlet />
        </div>
    );
};

export default Layout;
