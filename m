Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D99511F87B1
	for <lists+cocci@lfdr.de>; Sun, 14 Jun 2020 10:45:03 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05E8ii6r007025;
	Sun, 14 Jun 2020 10:44:44 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id EC95144A7;
	Sun, 14 Jun 2020 10:44:43 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8631D44A7
 for <cocci@systeme.lip6.fr>; Sun, 14 Jun 2020 10:44:42 +0200 (CEST)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20:0:0:0:32c])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05E8igwu013555
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 14 Jun 2020 10:44:42 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id q25so11870310wmj.0
 for <cocci@systeme.lip6.fr>; Sun, 14 Jun 2020 01:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+w+aF5PxLEDeR1CvNf2TkQaL4MjvBq4nqvGI+0Iqjk0=;
 b=lGx7OZ925j1+8Yh/ibYuK6CFEgspcjayYhPdHGzmLp/c34zvgsSAy/AmkA3e2sc9HW
 BW3yPuRWFdBM7qmr9LmJpmoOAINC+qUjrqly/MNRw2lxG0F0svSCxXW/f+/AqdqpzD0z
 cfm0M2nV5Q6nxf4ZYThoGSTlPxmob8b4eUGdRRv+wQ6RsAKoVabbLQNjdUb/SimjzXFo
 BMMODrNW+JUGNppx/WBTWbbUDzE5Sc5w8/iUiZF12mAEGgub5RmR2Ex9/13OozypCXd9
 mka0XYMvKYUBjED2c5gPcuMZIxRcsRdzOx9PevjcKjbKrloXN5KN0o/drhtJXyarmtPK
 9+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+w+aF5PxLEDeR1CvNf2TkQaL4MjvBq4nqvGI+0Iqjk0=;
 b=Nfdj7yInJWMdJMrQcG97Ip39TUZc9u9XZr+VjQ5fWzZlLq5RLaL+GLWp4R3Rks3TkN
 wczlqs9iIneBxt6qqiqHvHcmnQhDJRS0g4Ki+AqDjDwkVF3ohYSka3+vp0gV5c0l8CMO
 LrSFjA8XUZ0qXjInMuG1CGdFLSILRnbYmMm56T4drtxnEJXkBeOBItf03BMevQbvLpAI
 HYlqlaprkKLNafZ8JvvTKsW4HJ2xDHxnNd9ZDRNHoY86+AWoLvbYT7EBZpD2Tt9dE3sQ
 tNZN/WNg38MqhZKBrf4qRsYCUv4bKf3puLdygJ5iQjcdFgs062ChbNAcAHksbL9vMAGr
 pRKA==
X-Gm-Message-State: AOAM5329as1zkzuHEIAnZAhQZf2YncpbLQUcIoCQzMVmF/Gy/Dhb2DGq
 dDS8dQYYNhmQ24Z4RRrQmqQ=
X-Google-Smtp-Source: ABdhPJySi+qjea3vChWrG8CUHxJUlRYNdGuT8+zUwJ7NPni1ET1QDfaVn15VsYG2vsvOBXaUqdV1Bg==
X-Received: by 2002:a7b:c248:: with SMTP id b8mr7138907wmj.2.1592124281962;
 Sun, 14 Jun 2020 01:44:41 -0700 (PDT)
Received: from homer.simpson.net ([185.221.151.23])
 by smtp.googlemail.com with ESMTPSA id 138sm17653626wma.23.2020.06.14.01.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 01:44:41 -0700 (PDT)
Message-ID: <1592124280.2129.22.camel@gmail.com>
From: Mike Galbraith <umgwanakikbuti@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 14 Jun 2020 10:44:40 +0200
In-Reply-To: <alpine.DEB.2.22.394.2006141042270.2849@hadrien>
References: <b14e6d1d-afa0-5c28-547a-9bb1a987f6fd@infradead.org>
 <1592115803.27290.33.camel@gmail.com>
 <alpine.DEB.2.22.394.2006140940000.2849@hadrien>
 <1592121432.2129.9.camel@gmail.com>
 <alpine.DEB.2.22.394.2006141042270.2849@hadrien>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 14 Jun 2020 10:44:44 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Sun, 14 Jun 2020 10:44:42 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
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

On Sun, 2020-06-14 at 10:43 +0200, Julia Lawall wrote:
> 
> What is your Linux distribution?

openSUSE Leap-15.1
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
