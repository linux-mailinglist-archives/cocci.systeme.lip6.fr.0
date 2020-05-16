Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1DC1D6191
	for <lists+cocci@lfdr.de>; Sat, 16 May 2020 16:18:35 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04GEI6FR000688;
	Sat, 16 May 2020 16:18:06 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 5FC8C782B;
	Sat, 16 May 2020 16:18:06 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 29D2A3DC8
 for <cocci@systeme.lip6.fr>; Sat, 16 May 2020 16:18:04 +0200 (CEST)
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20:0:0:0:642])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04GEI3X1002747
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Sat, 16 May 2020 16:18:03 +0200 (CEST)
Received: by mail-ej1-x642.google.com with SMTP id o10so4762079ejn.10
 for <cocci@systeme.lip6.fr>; Sat, 16 May 2020 07:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HQE006TztJ8UhWtpYtXxeIxJ4v/oS6ymSTxMMoBhQmE=;
 b=UE1xnF/Zd1oyOfoTa028+ULWGgYBhVDn60MH4dWVvS9ITseLu7a7iKrvtB48ciO+B/
 8EDMCSICsHjiHD3mfc/1xcyFCYgo35uW3Z/bRyuNjT9kpy77hwgNIjjPY71Q0ou/u7aX
 +qt6m30TqQJR4ZBKRy/MbccET//7q9aWPi+D5WkQ2n9KwuKCaE4PZDoMj2jo9dVZOypW
 ly9Vvl32AdxrQZMqYYR0k5yRDZo2IjcQemN0qWehn4VOpJnnXp0ia8iUYcqIURAfo/tB
 y5MC2Rzse3NOTDSUHOFpu9kQ1Xs/hksuHL+ivKmt45qZ4gBdu3y5rZQFZtrmYxBohgQ/
 3lcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HQE006TztJ8UhWtpYtXxeIxJ4v/oS6ymSTxMMoBhQmE=;
 b=ETi0OpGNuRte/JSQ5lgUjAjsn5++p5p6nwJuaACrCSvtNZvOO08Vc+MottE60xSLXI
 v2NauIVAYcbCndD9mJxZq7ghqd/74KntFWp2k3zVN4u6zBUvsJTCHYGDKIwbwnVav0Ge
 5awd+hdZh0QpItS5vneCI1O6CzANkn+20kibFEqMwLuNj8Bcoc3JWIrHu/XNkpJsulgg
 PjHIH4fYHBO+jTQPuO9YK98CbU0JMewW/AnomvuMTSSBE/SsShPL6CDamvt6aih9DLve
 AW2iGtlcc8d0WPggkQe75e7FCZ+v6e9P3nHeqyAqZI8/CP3JrdyF3DQSq6IMKK89N/47
 Cgdg==
X-Gm-Message-State: AOAM530xLgmT5BjzSrUR5j4J9GbovT3uEcyAjEzEkQawl5lXxwK0v0in
 NVqfwT9fieDt6dzLdD8OgrJMMYcrfxFa+t9vsp524Q==
X-Google-Smtp-Source: ABdhPJxh2NmVYzVW6ATByo3OyXtZUVnN+utl4iOZm4z+Tm8Vx5ALK1Glwt0cGf7mckthbReF970YAssKQAcsCD5bwyM=
X-Received: by 2002:a17:906:1c94:: with SMTP id
 g20mr7330963ejh.319.1589638683228; 
 Sat, 16 May 2020 07:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <CANhBUQ2Bqxwk3o8w22L8yvSK+VWbf-WTSiaf8v9kbsqSv2VwAA@mail.gmail.com>
 <alpine.DEB.2.21.2005161047430.2573@hadrien>
 <CANhBUQ3YaJnVZwy2+Fo42Naa04wQiBnEO6cm-rGE05=rZp0XKw@mail.gmail.com>
 <alpine.DEB.2.21.2005161441500.2573@hadrien>
In-Reply-To: <alpine.DEB.2.21.2005161441500.2573@hadrien>
From: Chuhong Yuan <hslester96@gmail.com>
Date: Sat, 16 May 2020 22:17:52 +0800
Message-ID: <CANhBUQ0eoKJTeXHpMfRD2=Hnc4wvs95V2EvnFbEr_2ewHa5dLQ@mail.gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 16 May 2020 16:18:08 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Sat, 16 May 2020 16:18:03 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] How to match function calls in macros?
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

On Sat, May 16, 2020 at 8:45 PM Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>
> On Sat, 16 May 2020, Chuhong Yuan wrote:
>
> > On Sat, May 16, 2020 at 4:49 PM Julia Lawall <julia.lawall@inria.fr> wrote:
> > >
> > >
> > >
> > > On Sat, 16 May 2020, Chuhong Yuan wrote:
> > >
> > > > Hi all,
> > > > I want to write a script to match function calls in macros
> > > > but I don't know how to do that.
> > > > Here is an example:
> > > >
> > > > #define __INIT_WORK(_work, _func, _onstack)     \
> > > >     do {     \
> > > >         static struct lock_class_key __key; \
> > > >         \
> > > >         __init_work((_work), _onstack); \
> > > >         (_work)->data = (atomic_long_t) WORK_DATA_INIT(); \
> > > >         lockdep_init_map(&(_work)->lockdep_map,
> > > > "(work_completion)"#_work, &__key, 0); \
> > > >         INIT_LIST_HEAD(&(_work)->entry); \
> > > >         (_work)->func = (_func); \
> > > >     } while (0)
> > > >
> > > > In this example, I want to match function calls
> > > > like __init_work() and lockdep_init_map() in this macro.
> > > > So how to implement this by Coccinelle?
> > >
> > > I would suggest to take your file and run spatch --parse-c on the file.
> > > If you find BAD or bad in front of the lines of this code then the problem
> > > is that the code is not being parsed.  I suspect that the # is the
> > > problem.
> > >
> >
> > I have run parse-c and it says the example file is perfect.
> >
> > > Normally, Coccinelle will match code inside of macro definitions, but only
> > > if it is able to parse the macro definition, and the ability to parse
> > > macro definitions is somewhat limited.
> > >
> >
> > My expression is not very clear.
> > I want to know which macros have function calls and what functions do they call.
> > So I wrote a script like this:
> >
> > - #define mac(...) ... f(...) ...
> >
> > But it does not work on the example.
>
> Try:
>
> @@
> identifier mac,f;
> @@
>
> *#define mac(...) <+... f(...) ...+>
>
> ... means that the code before and after the ... cannot be matched by the
> ... when considering control-flow paths.  Your macro is a loop, so there
> is one call to f(...) after another. Coccinelle doesn't evaluate values,
> so it doesn't realize that a while(0) won't loop.
>

This works, thank you!

> julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
