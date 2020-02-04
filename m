Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 921B0151C89
	for <lists+cocci@lfdr.de>; Tue,  4 Feb 2020 15:48:47 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 014EmM6l003005;
	Tue, 4 Feb 2020 15:48:22 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 9CA5977F9;
	Tue,  4 Feb 2020 15:48:22 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id CAE9F77E8
 for <cocci@systeme.lip6.fr>; Tue,  4 Feb 2020 15:48:20 +0100 (CET)
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:742])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 014EmJHc005339
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 4 Feb 2020 15:48:20 +0100 (CET)
Received: by mail-qk1-x742.google.com with SMTP id w15so18134441qkf.6
 for <cocci@systeme.lip6.fr>; Tue, 04 Feb 2020 06:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yaerobi-com.20150623.gappssmtp.com; s=20150623;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=CuUQBpo45hMA8vhqhblcan4yZEPVw/fSC5540ErIHLo=;
 b=Y8/wTS6ODB6/Fv4uemAvttqvLV4gHlzVczEG/VuhoKQs4j3TnuX1S6Pmakg6w6NZRQ
 5ul13RpLnXWLYt/Ea0KXGTLYgsNWXWJnl+gyLt1asY5a61aoAHr8IOLTEXOioGHNXdFH
 WN286lDp4v40tLCIDKLtWrVVk3NqkcrkKwWPrZkFRdlCnJEHCzwGlrtPie7Wd7qqoAk4
 A51g4nDs5nX3WFH5+r25msDbzgQGoSwSRxCIMYpgFj5Wxpf1ctVuOmcpc/1sYFX53EaT
 LkJ7k7pvCRnViBoWdloCCcwZ78pCnSa0L5zGqi09blAltb/b9j+G2vnDSsSQzeQC6b1c
 qsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=CuUQBpo45hMA8vhqhblcan4yZEPVw/fSC5540ErIHLo=;
 b=Wx+ly6SDnN+O1eNbHsI/Jkc/JTgfSFrOvM+MfwKSlOQwZBONHM7ZTjlatJneKj0bdc
 /9KMSlVEGIlYCVrjtaJPN1HYKn9AXqGQfJ+4NjnZALF4hY06BCga6S8mzxaqg1RXp7f1
 jnZH6kCF8m2haomTA2fyhZVg7HaouxV3vRRh+3Bo7ixLbQqjzMawAow6eD4A2izdhH/L
 3pXdUMqIlHLXDDBTeGlEfydwIPAuj93mw1NBHWReT12IYsXO687oMLg37bzFs1mhMVrI
 Dq7M/lld5Rs2Tr3JL0RlyWJhzI6bsfAA9gFL7dxo19ja6iMuxET0fCDUtuGvD3LPXat4
 pudQ==
X-Gm-Message-State: APjAAAXVWaIXC/Cs4cB9+XKbsr5QmSPCh1seKD32nYWyiNvW/b+q4KZ2
 ziqrU6R4h+YDhIA4Tn5J7M1/tc2UxcI=
X-Google-Smtp-Source: APXvYqxnw6Y6ASF5MFWNPK8Dg4dBDm+jpXPM42oaWrWVvixu82xsO/5DUs2fdO4t/ycAId6RZcBpTw==
X-Received: by 2002:a37:91c2:: with SMTP id
 t185mr26527916qkd.284.1580827699011; 
 Tue, 04 Feb 2020 06:48:19 -0800 (PST)
Received: from [192.168.0.104] ([181.93.114.99])
 by smtp.gmail.com with ESMTPSA id z11sm11249105qkj.91.2020.02.04.06.48.17
 for <cocci@systeme.lip6.fr>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2020 06:48:18 -0800 (PST)
To: cocci@systeme.lip6.fr
From: eamanu <eamanu@yaerobi.com>
Message-ID: <786d2ea9-621f-bcc4-b626-aed6454784e2@yaerobi.com>
Date: Tue, 4 Feb 2020 11:48:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Language: en-US
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 04 Feb 2020 15:48:22 +0100 (CET)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 04 Feb 2020 15:48:20 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Subject: [Cocci] coccinelle depends on unmaintained pygtk
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

Hi everybody,

Sorry if this issues is duplicated, I am new in the mailing list
and in a very quickly searching I didn't found about this issue.

I am working on Coccinelle package on Debian and currently
exist the next bug [1].

There is any plan to port to use GObject Instrospection?


[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=885267


Thanks!

Cheers,
eamanu

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
