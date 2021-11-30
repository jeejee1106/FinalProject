<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<style>
.ListElementComponent__Wrapper-sc-1wy7ql5-0{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    border-width: 1px 0px;
    border-style: solid;
    border-color: rgb(230, 230, 230);
    border-image: initial;
    border-radius: 4px;
    border-left-width: 1px;
    border-right-width: 1px;
    margin-left: 0px;
    margin-right: 0px;
     }
.fnt-p1 fnt-bd{
	-webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    font-weight: 700;
    font-size: 16px;
    line-height: 27px;
    letter-spacing: -0.020em;
}    

.Label__Wrapper-ac7bbp-0{ 
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    word-break: break-all;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    box-sizing: inherit;
    position: relative;
    z-index: 1;
    top: -0.3em;
    min-height: 18px;
    padding: 0px 6px;
    font-size: 10px;
    line-height: 16px;
    letter-spacing: -0.005em;
    display: inline-flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    border-radius: 2px;
    font-weight: bold;
    color: rgb(255, 255, 255);
    background: rgb(255, 87, 87);
    margin: 0px 0px 0px 2px;
  }  
  
.fnt-p3{
	-webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-weight: 400;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    color: #3D3D3D;
    font-size: 13px;
    line-height: 20px;
    letter-spacing: -0.015em;
    }
.content{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    margin: 0px 16px 0px 0px;
    -webkit-box-flex: 1;
    flex-grow: 1;
    display: inline-flex;
    flex-flow: column;
    -webkit-box-pack: center;
    justify-content: center;
}
.RoundedWrapper__Wrapper-a7usag-0{
	 -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    border-width: 1px 0px;
    border-style: solid;
    border-color: rgb(230, 230, 230);
    border-image: initial;
    border-radius: 4px;
    border-left-width: 1px;
    border-right-width: 1px;
    margin-left: 0px;
    margin-right: 0px;
}
.container{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: #3d3d3d;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    box-sizing: border-box;
    width: 672px;
    margin: 0px 32px 0px 0px;
    flex: 0 0 auto;
}
.SettingForm__Wrapper-sc-169upu5-0{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    padding: 0px 0px 20px;
    border-bottom: 0px;
    margin: 0px;
}

.SettingForm__FormHeader-sc-169upu5-1{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-weight: 400;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    display: flex;
    margin: 0px 0px 12px;
    font-size: 16px;
    line-height: 27px;
    letter-spacing: -0.020em;
}

.SettingForm__FormTitle-sc-169upu5-2{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    color: #3d3d3d;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    font-size: 16px;
    letter-spacing: -0.020em;
    box-sizing: inherit;
    line-height: 1.7em;
    word-break: break-all;
    display: flex;
    flex-wrap: wrap;
    -webkit-box-align: center;
    align-items: center;
    font-weight: bold;
    -webkit-box-flex: 1;
    flex-grow: 1;
    margin: 0;
    padding: 0;
}

.PlainLink__StyledLink-qbfirs-0{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    word-break: break-all;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    box-sizing: inherit;
    font: inherit;
    margin: 0;
    overflow: visible;
    text-transform: none;
    -webkit-appearance: button;
    background: transparent;
    border: 0px;
    padding: 0px;
    cursor: pointer;
    color: rgb(39, 163, 255);
    font-weight: normal;
    text-decoration: none;
    outline: 0;
}
.Modal__PosWrapper-sc-1ul7s4n-0{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    width: 100%;
    min-width: 328px;
    position: absolute;
    height: auto;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    overflow: hidden;
    background: transparent;
    max-width: 600px;
    max-height: 100vh;
    border-radius: 4px;
}
.Modal__Wrapper-sc-1ul7s4n-1{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    padding: 24px 32px 40px;
    background: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0.16) 0px 2px 16px 0px;
    border-radius: 4px;
}
.Modal__Header-sc-1ul7s4n-5{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    font-weight: bold;
    font-size: 24px;
    line-height: 36px;
    letter-spacing: -0.025em;
    margin: 0px 0px 24px;
    position: relative;
    padding: 0px;
    height: auto;
}
.SolidButton__Button-sc-1gsinzz-0{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    word-break: break-all;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    font: inherit;
    overflow: visible;
    text-transform: none;
    -webkit-appearance: button;
    cursor: pointer;
    display: inline-flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    white-space: nowrap;
    border-radius: 4px;
    font-weight: normal;
    box-sizing: border-box;
    color: rgb(61, 61, 61);
    width: 20px;
    height: 20px;
    background: none;
    border: 0px;
    padding: 0px;
    outline: 0;
    font-size: 16px;
    line-height: 27px;
    letter-spacing: -0.020em;
    z-index: 3;
    position: absolute;
    top: 50%;
    right: 0px;
    margin: -10px 0px 0px;
}
.Icon__SVGICON-sc-1xkf9cp-0{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font: inherit;
    text-transform: none;
    cursor: pointer;
    white-space: nowrap;
    font-weight: normal;
    color: rgb(61, 61, 61);
    font-size: 16px;
    line-height: 27px;
    letter-spacing: -0.020em;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    align-self: center;
    display: flex;
}
.Modal__HasBackWrapper-sc-1ul7s4n-6{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    max-height: 75vh;
    overflow: hidden auto;
}
.ModalAddAddress__Wrapper-sc-1nr6gof-3{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    width: 100%;
}
.StyledTBB__FormWrapper-trchgn-6{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    margin-top: 0px;
}
.StyledTBB__FormLabel-trchgn-4{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    color: rgb(61, 61, 61);
    margin: 0px 0px 10px;
}
.StyledTBB__FormContent-trchgn-5{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    width: auto;
}
.Input__InputWrapper-j7moqy-0{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-weight: 400;
    word-break: break-all;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    box-sizing: inherit;
    border: 1px solid rgb(230, 230, 230);
    color: rgb(13, 13, 13);
    background: rgb(255, 255, 255);
    padding: 0px 12px;
    max-height: 44px;
    min-width: 100px;
    display: flex;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    -webkit-box-align: center;
    align-items: center;
    border-radius: 4px;
    width: 230px;
}
.Input__InnerInput-j7moqy-1{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    word-break: break-all;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    color: inherit;
    font: inherit;
    line-height: normal;
    width: 100%;
    background: transparent;
    border: 0px;
    padding: 11px 0px;
    box-sizing: border-box;
    height: 100%;
    outline: none;
    margin: 0px;
    appearance: none !important;
}
.StyledTBB__FormWrapper-trchgn-6{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    margin-top: 32px;
}
.StyledTBB__FormLabel-trchgn-4{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    color: rgb(61, 61, 61);
    margin: 0px 0px 10px;
}
.StyledTBB__FormContent-trchgn-5{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    width: auto;
}
.Input__InputWrapper-j7moqy-0{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-weight: 400;
    word-break: break-all;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    box-sizing: inherit;
    border: 1px solid rgb(230, 230, 230);
    color: rgb(13, 13, 13);
    background: rgb(255, 255, 255);
    padding: 0px 0px 0px 12px;
    max-height: 44px;
    min-width: 100px;
    display: flex;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    -webkit-box-align: center;
    align-items: center;
    border-radius: 4px;
}
.Input__InnerInput-j7moqy-1{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    word-break: break-all;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    color: inherit;
    font: inherit;
    line-height: normal;
    width: 100%;
    background: transparent;
    border: 0px;
    padding: 11px 0px;
    box-sizing: border-box;
    height: 100%;
    outline: none;
    margin: 0px;
    appearance: none !important;
}
.IconButton__Button-xhb7j7-0{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    word-break: break-all;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    font: inherit;
    overflow: visible;
    text-transform: none;
    -webkit-appearance: button;
    cursor: pointer;
    display: inline-flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    height: 40px;
    white-space: nowrap;
    margin: 0px;
    border: 0px;
    font-weight: normal;
    box-sizing: border-box;
    padding: 0px 16px;
    background-color: transparent;
    color: rgb(61, 61, 61);
    outline: 0;
    font-size: 16px;
    line-height: 27px;
    letter-spacing: -0.020em;
}
.IconButton__ContentWrapper-xhb7j7-1{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font: inherit;
    text-transform: none;
    cursor: pointer;
    white-space: nowrap;
    font-weight: normal;
    color: rgb(61, 61, 61);
    font-size: 16px;
    line-height: 27px;
    letter-spacing: -0.020em;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    display: inline-flex;
}
.Icon__SVGICON-sc-1xkf9cp-0{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font: inherit;
    text-transform: none;
    cursor: pointer;
    white-space: nowrap;
    font-weight: normal;
    color: rgb(61, 61, 61);
    font-size: 16px;
    line-height: 27px;
    letter-spacing: -0.020em;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    display: inline-flex;
    align-self: center;
}
.StyledTBB__FormWrapper-trchgn-6{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    margin-top: 32px;
}
.StyledTBB__FormLabel-trchgn-4{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    color: rgb(61, 61, 61);
    margin: 0px 0px 10px;
}
.StyledTBB__FormContent-trchgn-5{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    width: auto;
}
.Input__InputWrapper-j7moqy-0{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-weight: 400;
    word-break: break-all;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    box-sizing: inherit;
    border: 1px solid rgb(230, 230, 230);
    color: rgb(13, 13, 13);
    background: rgb(255, 255, 255);
    padding: 0px 12px;
    max-height: 44px;
    min-width: 100px;
    display: flex;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    -webkit-box-align: center;
    align-items: center;
    border-radius: 4px;
}
.Input__InnerInput-j7moqy-1{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    word-break: break-all;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    color: inherit;
    font: inherit;
    line-height: normal;
    width: 100%;
    background: transparent;
    border: 0px;
    padding: 11px 0px;
    box-sizing: border-box;
    height: 100%;
    outline: none;
    margin: 0px;
    appearance: none !important;
}
.CommonStyled__CheckBoxWrapper-bpcmiq-10{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    margin: 20px 0px 0px;
    display: flex;
    flex-flow: column;
}
.row{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    margin-bottom: 0px;
}
.Checkbox__Wrapper-sc-1j98t5d-1{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    word-break: break-all;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    box-sizing: inherit;
    cursor: pointer;
    position: relative;
    overflow: hidden;
    padding: 0px 0px 0px 29px;
    color: rgb(61, 61, 61);
    display: inline-flex;
}
.Checkbox__Checked-sc-1j98t5d-0{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    word-break: break-all;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    cursor: pointer;
    box-sizing: inherit;
    position: absolute;
    z-index: 3;
    left: 0px;
    top: 0.14em;
    width: 20px;
    height: 20px;
    border-radius: 2px;
    color: rgb(255, 255, 255);
    background: rgb(255, 87, 87);
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
}
.Icon__SVGICON-sc-1xkf9cp-0{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    cursor: pointer;
    color: rgb(255, 255, 255);
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    display: inline-flex;
    align-self: center;
}
.SolidButton__Button-sc-1gsinzz-0{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    word-break: break-all;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    font: inherit;
    overflow: visible;
    text-transform: none;
    -webkit-appearance: button;
    width: 100%;
    cursor: pointer;
    display: inline-flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    height: 52px;
    white-space: nowrap;
    border-radius: 4px;
    border: 0px;
    font-weight: bold;
    box-sizing: border-box;
    padding: 0px 24px;
    background-color: rgb(255, 87, 87);
    color: rgb(255, 255, 255);
    outline: 0;
    font-size: 16px;
    line-height: 27px;
    letter-spacing: -0.020em;
    margin: 40px 0px 0px;
}




</style>

	<div class="Container__ContainerComponent-sc-1ey2h1l-0 kUAclQ StyledTBB__column2Wrapper-trchgn-2 CommonStyled__Wrapper-bpcmiq-0 gYkBev cwoqcI">
		<div class="container">
			<div class="SettingForm__Wrapper-sc-169upu5-0 jKMMYF forms">
				<div class="SettingForm__FormHeader-sc-169upu5-1 jzTvBl fnt-p1">
					<p class="SettingForm__FormTitle-sc-169upu5-2 jKbeSH">등록된 배송지</p>
					<button class="PlainLink__StyledLink-qbfirs-0 iFKMSH delivery"
				data-toggle="modal" data-target="#moaModal" color="sub0180" type="button">+ 추가</button>
				</div>
			<c:if test="${totalCount==0}">
				<img src="../photo/delivery.PNG">
			</c:if>
			<c:forEach var="a" items="${list}" varStatus="i">
				<div class="RoundedWrapper__Wrapper-a7usag-0 qlVky">
					<div class="ListElementComponent__Wrapper-sc-1wy7ql5-0 gxVril"
						type="address">
						<div class="content" style="margin:20px; 10px; 20px; 10px;">
							<div class="fnt-p1 fnt-bd">
								<b>${a.name }</b>
								<c:if test="${a.pin==1 }">
								<span type="isDefault" class="Label__Wrapper-ac7bbp-0 gWxYCF CommonStyled__DefaultLabel-bpcmiq-12 hSXOrt">기본</span>
								</c:if>
								<span class="glyphicon glyphicon-pencil d_update" data-toggle="modal" data-target="#moaModalupdate" style="margin-left:400px; cursor:pointer;"></span>
								&nbsp;<span class="glyphicon glyphicon-remove d_delete" style="cursor:pointer;"></span>
							</div>
							<div class="fnt-p3 tbb-clr-gray-80">
								${a.addr } ${a.addr2 }<br>${a.hp }
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
		</div>
		</div>
		<div class="CommonStyled__SettingPageDescBox-bpcmiq-1 cwYHpD">
			<p class="fnt-p1 tbb-clr-gray-80 fnt-st-bd">배송지를 삭제하면 예약된 후원의 배송지
				정보도 삭제되나요?</p>
			<div class="fnt-p3 tbb-clr-gray-60">
				현재 후원하신 프로젝트에 등록된 배송지가 삭제되거나 변경되진 않습니다. 이를 변경하시려면 후원현황에서
				변경해주세요.&nbsp;<span color="sub0180"
					class="PlainNavLink__Wrapper-sc-9qhsie-0 kZoYUd"><a
					href="/pledges">내 후원현황 바로가기</a></span>
			</div>
		</div>
	</div>






 <!-- Moa Modal-->
  <div class="modal fade" id="moaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" id="exampleModalLabel"><b>배송지 추가</b></h4>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">x</span>
          </button>
        </div>
        <div class="modal-body">
	        <span>받는 사람</span>
	     <!--    <form action="deliveryinsert" method="post"> -->
	        <input type="hidden" name="id" id="id" value="${dto.id }">
	         <input type="text" class="form-control" style="margin-top:10px; width:60%; height:40px;" id="name" placeholder="받는 분 성함을 입력해주세요."
                        name="name" maxlength="20" required="required" >
            <span>주소</span>
            <input type="hidden" id="sample4_postcode" placeholder="우편번호">
            <span class="glyphicon glyphicon-search" style="margin-top:30px; cursor:pointer;" onclick="sample4_execDaumPostcode()"></span><br>
			<input type="text" class="form-control" style="margin-top:10px; height:40px;" id="sample4_roadAddress" placeholder="도로명주소">
			<span id="guide" style="color:#999;display:none"></span><br>
			<input type="text" class="form-control" id="sample4_detailAddress" style="margin-top:-10px; margin-bottom:30px; height:40px;" placeholder="상세주소">
			
			<span>받는 사람 휴대폰 번호</span>
			<input type="text" class="form-control" id="hp1" name="hp" maxlength="20" style="width: 100%; margin-top: 10px; height:40px;" placeholder="받는 분 휴대폰 번호를 입력해주세요.">
            <input type="checkbox" id="pin" style="margin-top:30px; margin-bottom:20px;"> 기본 배송지로 등록   
             <div class="modal-footer">
          		<button class="btn btn-danger insterbtn" style="width:100%" type="submit" data-dismiss="modal">등록완료</button>
       		 </div>
        <!-- </form>  -->
        </div>
        
      </div>
    </div>
  </div>
  
  
   <!-- Moa Modal-->
  <div class="modal fade" id="#moaModalupdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" id="exampleModalLabel"><b>배송지 추가</b></h4>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">x</span>
          </button>
        </div>
        <div class="modal-body">
	        <span>받는 사람</span>
	     <!--    <form action="deliveryinsert" method="post"> -->
	        <input type="hidden"  id="updateid" value="${dto.id }">
	         <input type="text" class="form-control" style="margin-top:10px; width:60%; height:40px;" id="updatename" placeholder="받는 분 성함을 입력해주세요."
                        maxlength="20" required="required" value="">
            <span>주소</span>
            <input type="hidden" id="sample4_postcode" placeholder="우편번호">
            <span class="glyphicon glyphicon-search" style="margin-top:30px; cursor:pointer;" onclick="sample4_execDaumPostcode()"></span><br>
			<input type="text" class="form-control" value="" style="margin-top:10px; height:40px;" id="sample4_roadAddress" placeholder="도로명주소">
			<span id="guide" style="color:#999;display:none"></span><br>
			<input type="text" class="form-control" id="sample4_detailAddress" value="" style="margin-top:-10px; margin-bottom:30px; height:40px;" placeholder="상세주소">
			
			<span>받는 사람 휴대폰 번호</span>
			<input type="text" class="form-control" id="updatehp1" value="" maxlength="20" style="width: 100%; margin-top: 10px; height:40px;" placeholder="받는 분 휴대폰 번호를 입력해주세요.">
            <input type="checkbox" id="pin" style="margin-top:30px; margin-bottom:20px;"> 기본 배송지로 등록   
             <div class="modal-footer">
          		<button class="btn btn-danger insterbtn" style="width:100%" type="submit" data-dismiss="modal">등록완료</button>
       		 </div>
        <!-- </form>  -->
        </div>
        
      </div>
    </div>
  </div>














<script type="text/javascript">
	

		$("span.d_update").click(function() {
			//alert("dfdfd");
				$("#moaModalupdate").modal();
		});
	

	  $("button.delivery").click(function() {
	  		//alert("dfdfd");
	  		$("#moaModal").modal();
		});
	  	
	//삭제 버튼 이벤트
		$("button.insterbtn").click(function(){
			
			var check = $("#pin").is(":checked");
			
			var pin
			
			if(check){
				pin = 1;
			}else{
				pin = 0;
			}
			
			//num,pass 읽기
			var id=$("#id").val();
			var name=$("#name").val();
			var addr=$("#sample4_roadAddress").val();
			var addr2=$("#sample4_detailAddress").val();
			var hp=$("#hp1").val();
			//삭제파일 호출
			$.ajax({
				type:"get",
				dataType:"json",
				data:{"id":id,"name":name,"addr":addr,"addr2":addr2,"hp":hp,"pin":pin},
				url:"deliveryinsert",
				success:function(data){
					
				}
			});
		});
	  
	  </script>

		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>















