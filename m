Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D4C156440
	for <lists+cocci@lfdr.de>; Sat,  8 Feb 2020 13:42:25 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 018CfZLh000450;
	Sat, 8 Feb 2020 13:41:35 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C13ED77FC;
	Sat,  8 Feb 2020 13:41:35 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 321887718
 for <cocci@systeme.lip6.fr>; Sat,  8 Feb 2020 13:41:33 +0100 (CET)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:1043])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 018CfVf8025843
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Sat, 8 Feb 2020 13:41:32 +0100 (CET)
Received: by mail-pj1-x1043.google.com with SMTP id gv17so2129588pjb.1
 for <cocci@systeme.lip6.fr>; Sat, 08 Feb 2020 04:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=NzAC5MHbrI5UrG1L3FVdHafeYKskK0RDKuoxzb6SsSw=;
 b=hfXudPHWgIT+H2enk6nqij9pre4evi2LXn53I2MnGnWYDwvBo34rfOWHBbjY+ljn4W
 qvJZYMWNvxPIdvDtaeMVnJ3h5lgyctgjFunGzMpZnyETgEQREHPpRuopn6A+n6Sl/ETA
 kYzQ9Xjycy2KXT2FJUbQ+rExzfI8VEZhoFLyoMGwhwC8dCr9fBZtGoY5ZzYNAXfPlveg
 +n7Vuaw2z6r3LjBeRWiK9u1XlLr2KVJGn3tEhXS38nYa7TqFtqOJeBdXT/E1BgMc6ntf
 yvsvP9vFBEtOCEYK4a54tb1V8LgmRBbfAL4WTiwQ4hHzvhl0ADNOHrlzms0iDgd0HsTt
 dNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=NzAC5MHbrI5UrG1L3FVdHafeYKskK0RDKuoxzb6SsSw=;
 b=QGgzPt8lrAk+bLvYbyj+qNRSQ0kUV945SN7Axj4heWoQj2YuFJijGuxUlshGF+8GsM
 PC9gUjHo2/mernjpBPFVUGTRe9RYDxYJ6IwDhjuqYodMxRB3cKlb152tq8QUmb0GME4g
 8veP1lxeCGOTZaG2UqzHBqQz26K2k0Zk9xl+1VMpgSpW+RjneG/DekcgubJAZn9rqUFv
 ft53j79dv/W97DfYAOze+EhtB0ea7J/YNyAk6NCMr4+cCpzJZy1MoSItCGtXXiHPyOug
 4Zy0onhpqQWROJHAba3NPSiCBKeZP+Fewaq4OGIwM8VLUX4lqsJ/J8+czJHEPs+cbhRa
 TFyA==
X-Gm-Message-State: APjAAAVaRc4zXCC/Axc5KBtAGjypQktj7xRtINOROKBhaK1xwQ4J5ufK
 B2qTmOKk0xSvTy1wV+2xaJs=
X-Google-Smtp-Source: APXvYqyPQAw/0btz4QpV4VqPX123x4OL9WLGtJyU+JzD/a8EM2qKsftVaQ7YlfRKozgftw7JD/+Klw==
X-Received: by 2002:a17:902:b583:: with SMTP id
 a3mr3714149pls.180.1581165690736; 
 Sat, 08 Feb 2020 04:41:30 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:167e:bd84:9372:6e6d:597e:c921])
 by smtp.gmail.com with ESMTPSA id i2sm5965325pjs.21.2020.02.08.04.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 04:41:30 -0800 (PST)
Message-ID: <6f51f690d06cdd2278900480bd079cd90895ec43.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 08 Feb 2020 18:11:17 +0530
In-Reply-To: <88e09c8a-e39f-2722-9f87-333d2c14a7a2@web.de>
References: <88e09c8a-e39f-2722-9f87-333d2c14a7a2@web.de>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 08 Feb 2020 13:41:37 +0100 (CET)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Sat, 08 Feb 2020 13:41:32 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
        "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH 1/2] parsing_c: Align C AST and Cocci AST for
 const pointer variants
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

On Sat, 2020-02-08 at 09:30 +0100, Markus Elfring wrote:
> > For a pointer, the C parser constructed an AST dissimilar from that
> > of the Cocci AST. This caused failures in matching with certain
> > pointer types. For example, for the following case:
> > 
> > char *1 const *2 id;
> > 
> > The C AST constructed would be:
> > const Pointer1 -> Pointer2 -> char
> > 
> > The Cocci AST constructed would be:
> > Pointer2 -> const Pointer1 -> char
> 
> Which software development tools support to check such information?
> 

A little collection of scripts/tools I've written[1], and the
invaluable OCaml debugger :)

Cheers,
Jaskaran.

[1]http://github.com/jajajasalu2/cocci-type-test-suite

> Regards,
> Markus

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
