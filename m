Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 147F11F87AD
	for <lists+cocci@lfdr.de>; Sun, 14 Jun 2020 10:41:58 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05E8fPkL017644;
	Sun, 14 Jun 2020 10:41:25 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B70707760;
	Sun, 14 Jun 2020 10:41:25 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 075A944A7
 for <cocci@systeme.lip6.fr>; Sun, 14 Jun 2020 10:00:52 +0200 (CEST)
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20:0:0:0:441])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05E80pLc008464
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 14 Jun 2020 10:00:51 +0200 (CEST)
Received: by mail-wr1-x441.google.com with SMTP id e1so13992500wrt.5
 for <cocci@systeme.lip6.fr>; Sun, 14 Jun 2020 01:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QPVH2/Ib6oOX8dlQZ/WkdSwId5i9NfxbMF8lf4M1ukk=;
 b=ZjurOuRW7nDQ4Z64h7bpPYDr4Us9jLvIA+ghOvxCwK/JvTNSyw+jvkmVVWXwl7/str
 c8Ee83SwdfgvQmQ6dtaqo8o0cUAhsxsmZNORW0+Lx59ZPYwI1PBYelt4ENQ3XKyy7NSh
 KNY9rafc/S4weFqG+x4fp6htgmCvyjUIrWbJviRD/SB9uUNgokZyvaWDmCw9xAu3j8Y2
 +peDFBFYlSPpzuUcViK4uSpNhWjVdU2EBq96l635JY6JWe/galGGect4Vwv+a/WkyphS
 7Bi4xcbKRwbTP7a6ZBqGFl1kyk/s0FFhuw79BHNQJ73ySDqskPLZDbkgy+AGPXEc/QLT
 7E5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QPVH2/Ib6oOX8dlQZ/WkdSwId5i9NfxbMF8lf4M1ukk=;
 b=NQn0iOpJhmDXyS23xP/JbXfG2DYhl10rDs91N3JOclJuGSi/Sm/FY74u6ofyEwboNi
 tfnHoVvfyYFS2fVA6vTV67gUvDbb60ui0lVrA5SMW880fL1k3/zgaWc3AYilJTo0sbrP
 ZbuUHrS5eav1NKYdr9sZfJQ+Kiw92X1I8xLcewVqAV4JO7puFD3mUVsGYfeI/0iRqrtY
 FLLDznRsw1KhIPpQPQNkOg29HPmXlJxqcZ7srhSBFLO1rOY1WaURmRTbJp6XrQw4S2uK
 6Lsf4Jwpzes0Qc3j1B9i8xZ0agk4nRIFeZAf/G0fM6uwnI5dWFV0NqEA9wh3sLtwr3pJ
 R+CQ==
X-Gm-Message-State: AOAM532qBb2+cTqyCKKtad5tFa0+J1Mod+VIERph0pSde+dyAjC7A0+E
 t351kSvkcWC34tsorLekAlo=
X-Google-Smtp-Source: ABdhPJxseeyRjU1aIC0KmeQTYvrmpvXQ3a3m9bNU55Pucpvn3a0Y1kLGydTxkepMAkclb03rO3iBLw==
X-Received: by 2002:adf:ff82:: with SMTP id j2mr22365894wrr.375.1592121651339; 
 Sun, 14 Jun 2020 01:00:51 -0700 (PDT)
Received: from homer.simpson.net ([185.221.151.23])
 by smtp.googlemail.com with ESMTPSA id x66sm17025467wmb.40.2020.06.14.01.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 01:00:50 -0700 (PDT)
Message-ID: <1592121650.2129.11.camel@gmail.com>
From: Mike Galbraith <umgwanakikbuti@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 14 Jun 2020 10:00:50 +0200
In-Reply-To: <1592121432.2129.9.camel@gmail.com>
References: <b14e6d1d-afa0-5c28-547a-9bb1a987f6fd@infradead.org>
 <1592115803.27290.33.camel@gmail.com>
 <alpine.DEB.2.22.394.2006140940000.2849@hadrien>
 <1592121432.2129.9.camel@gmail.com>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 14 Jun 2020 10:41:27 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Sun, 14 Jun 2020 10:00:51 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
X-Mailman-Approved-At: Sun, 14 Jun 2020 10:41:23 +0200
Cc: Randy Dunlap <rdunlap@infradead.org>, cocci@systeme.lip6.fr
Subject: Re: [Cocci] coccinelle issues
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

On Sun, 2020-06-14 at 09:57 +0200, Mike Galbraith wrote:
> On Sun, 2020-06-14 at 09:42 +0200, Julia Lawall wrote:
> > 
> > On Sun, 14 Jun 2020, Mike Galbraith wrote:
> > 
> > 
> > > I didn't download, rather pulled/built.  I didn't have the same issue
> > > you did, but make coccicheck was a bust here until I backed down to
> > > version 1.0.6.  Neither HEAD, 1.0.8 or 1.0.7 ran, and following its
> > > MODE=blah suggestion helped not at all.
> > 
> > Did you get a segmentation fault?
> 
> Nope.  Turned out to be a dinky install gotcha.  Creating a symlink..
> 
> lrwxrwxrwx 1 root root 27 Jun 14 09:40 /usr/local/coccinelle/lib -> /usr/local/coccinelle/lib64
> 
> ..seems to have fixed 1.0.8 all up.  The very first time I installed, I
> had to create one directory (forget which) by hand as well.

Oh well, not all fixed up, but it does run.

./fs/xfs/xfs_rmap_item.c:56:5-24: atomic_dec_and_test variation before object free at line 57.
./kernel/nsproxy.c:253:11-30: atomic_dec_and_test variation before object free at line 254.
./net/unix/scm.c:80:6-30: atomic_dec_and_test variation before object free at line 81.
coccicheck failed
make: *** [Makefile:1822: coccicheck] Error 2
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
