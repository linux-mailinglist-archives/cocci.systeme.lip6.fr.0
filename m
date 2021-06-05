Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4643C39D461
	for <lists+cocci@lfdr.de>; Mon,  7 Jun 2021 07:32:35 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 1575W22P021304;
	Mon, 7 Jun 2021 07:32:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 6AE91402A;
	Mon,  7 Jun 2021 07:32:02 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 469D4402A
 for <cocci@systeme.lip6.fr>; Mon,  7 Jun 2021 07:31:58 +0200 (CEST)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 1575VtRI028555
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 7 Jun 2021 07:31:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1622925912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YXaK6DW9Y9B6v1oVR9K+bQiYsFDjZWjDCfi33/Xn7uQ=;
 b=K/e9xVtBG5v8ziBCNRZexiReAEPqAdJEDHWDJZQVXsCPqva9qDfTh+bY4aiA9O91le19dG
 MDnvrpwx5BLil71HwmPOYxtr30vbPNCIzSsut84666+lBvQGFG/hA4QOKAhqJxWPdbaOt6
 KkT9QPF3vEJB1F7v9/UutyWl/CV5FuU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4046349c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <cocci@systeme.lip6.fr>;
 Sat, 5 Jun 2021 20:45:12 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id e10so18924085ybb.7
 for <cocci@systeme.lip6.fr>; Sat, 05 Jun 2021 13:45:12 -0700 (PDT)
X-Gm-Message-State: AOAM5321pRoyswvj+vGWq6nv6UVKy7OAa3bcjpSV+B8oF6fwAnGRVh2+
 U5V18ROUXLa7fq/cdH9qQjgTMDMyIEerVwIGCZw=
X-Google-Smtp-Source: ABdhPJzVRZfksN4Xsa+TPtAqjfBKQRAgjJrtUn9qMVTmfjwTrYBpqL94KxkanCWg9plO3npvLdNy5olxcqrvniDORMg=
X-Received: by 2002:a25:af82:: with SMTP id g2mr13818422ybh.456.1622925911589; 
 Sat, 05 Jun 2021 13:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9rRQmSLkU6ELNiC=pr-D7CGjdyw27_oXdBp+hMdn8WQ5Q@mail.gmail.com>
 <alpine.DEB.2.22.394.2106051335410.25155@hadrien> <YLvDVI9TCEVoL16r@zx2c4.com>
 <alpine.DEB.2.22.394.2106052149580.32368@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2106052149580.32368@hadrien>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 5 Jun 2021 22:45:00 +0200
X-Gmail-Original-Message-ID: <CAHmME9qukRfmo9ooa4O-2Z1CbdZaGxY70JiHgwD4QiaYTr100g@mail.gmail.com>
Message-ID: <CAHmME9qukRfmo9ooa4O-2Z1CbdZaGxY70JiHgwD4QiaYTr100g@mail.gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 07 Jun 2021 07:32:04 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 07 Jun 2021 07:31:58 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] struct type renaming in the absence of certain function
	calls on members
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

Thanks! That seems to be it indeed. Interestingly, including the
actual path to the real headers with -I didn't fix the issue. I tried
adding other options passed as -D to the compiler in a macro file, in
case that was influencing the parsing, to no avail. So in the end I
indeed went with just defining those to int. Seems to work well! Last
minor cosmetic issue is that it turns `struct a
[space][space][space][space][space][space][space] x` into `struct b
[space] x`, which is easy enough to fix up by hand. (The BSDs do weird
and terrible things with whitespace sometimes.)

Jason
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
