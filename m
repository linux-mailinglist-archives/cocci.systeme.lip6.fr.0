Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4187D1EBBFB
	for <lists+cocci@lfdr.de>; Tue,  2 Jun 2020 14:46:00 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 052CjSOo011200;
	Tue, 2 Jun 2020 14:45:28 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1F58A7828;
	Tue,  2 Jun 2020 14:45:28 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id BE6113F9A
 for <cocci@systeme.lip6.fr>; Tue,  2 Jun 2020 14:45:25 +0200 (CEST)
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20:0:0:0:543])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 052CjOeV012557
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 2 Jun 2020 14:45:25 +0200 (CEST)
Received: by mail-ed1-x543.google.com with SMTP id g1so9086037edv.6
 for <cocci@systeme.lip6.fr>; Tue, 02 Jun 2020 05:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cilium-io.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=unWoQ0dVwzSE9DNAJqUuYnCBOrzSqIBIn4fnDN1Mrmg=;
 b=AKfual5OUO1LWUdnUg30Iy/eiKDq+PoL1FvPha7lEzoqWAoDhWj9Bh3ovFqSXt+YUO
 74G2Kh5GNh22yo89Kqj/m90BsAGu+FPc/4Q4SY/56ecPgHTtjzaDk/8KT39cmKqmUCAS
 YXUg5V9jbzAL2Ymd9vUTppl6mAXaHf/Ym5KE64iges4hKkZ4W366eb2KOFIHj6dqNbyP
 f3HhkDG7SHdOtPsyoTvaIPG5GU7PFtkfZcgKYXelpMHT6BeBPrerLnd1tenCb+bCLcwa
 SpEquqMGxT+bgGfhre6Sv7IWljB44LdxP14xBDGO+iEH2AoF7ZKKctFpo4MpBtnmxiYp
 ggaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=unWoQ0dVwzSE9DNAJqUuYnCBOrzSqIBIn4fnDN1Mrmg=;
 b=iIbUhClGF2WYSH4lKZsh0n3zBaVHLHuQaZjytSxnnqbp5eyZC5y9KxWrjD7NgTyz4v
 yZbWgJhFfAwPapPEPV5a7ZDiDuWDka342x8hlTFmfskJzbYbBJHDiCHD8mDMIfulEqDI
 /H/7pEORihjFJuQCIXleuSZj5kp+ipNfSEWdxMYs2g1E/5CJ/P04SJdD9gU7iwtDPfPP
 EofC3LcYI1mj28r4rZpTO7CL6aHLgkvqP5FyGpwqxB1B+KNb9miURCp6l5HMlh/DD9Mr
 KKn1meGe0U0APCp1BGfS8txgUp0sqFF94JahDEG3FhPCwuyqf/h58ZWWX6i65QUAJcEv
 5mNw==
X-Gm-Message-State: AOAM530YGVSPZDVbJDn9YbUj9XLZkIYEaxqtKpYJLr6s++nGEvBe9bzh
 cX/Ait8J59tXjFuqyEbINTWTxLFuM488
X-Google-Smtp-Source: ABdhPJyKzeYnuIz6FsZud1W5uXSSHIVdy+bdtASeLt3ycbgfYlObsulBGs0LcN7afm7dxEwVsAlAwA==
X-Received: by 2002:a05:6402:52:: with SMTP id
 f18mr26704637edu.7.1591101924395; 
 Tue, 02 Jun 2020 05:45:24 -0700 (PDT)
Received: from Mem ([81.30.78.170])
 by smtp.gmail.com with ESMTPSA id rl16sm1610309ejb.33.2020.06.02.05.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 05:45:23 -0700 (PDT)
Date: Tue, 2 Jun 2020 14:45:23 +0200
From: Paul Chaignon <paul@cilium.io>
To: Julia Lawall <julia.lawall@inria.fr>
Message-ID: <20200602124522.GA2774@Mem>
References: <20200602092802.GA24095@Mem>
 <alpine.DEB.2.21.2006021214430.4634@hadrien>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2006021214430.4634@hadrien>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 02 Jun 2020 14:45:29 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 02 Jun 2020 14:45:25 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Whitelist function in rule
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

On Tue, Jun 02, 2020 at 12:19:50PM +0200, Julia Lawall wrote:
> 
> 
> On Tue, 2 Jun 2020, Paul Chaignon wrote:
> 
> > Hi all,
> >
> > I'm trying to find calls to ep_tail_call() that are *not* followed by
> > 'return DROP_MISSED_TAIL_CALL'. That works fine (rule1 below), but I then
> > want to whitelist one specific function, send_drop_notify().
> >
> > I couldn't find a way to do that from the first rule, so I whitelisted
> > send_drop_notify() with a second rule (rule2 below). That seems rather
> > cumbersome and I'm wondering if there's maybe a simpler approach?
> >
> >   @rule1@
> >   position p1;
> 
> In coccinelle/tests/python_poscon.cocci you have an example of how to
> attach python code to a metavariable:
> 
> @initialize:python@
> @@
> 
> def past_line_4(p, other):
>     return int(p[0].line) > 4
> 
> @r@
> expression e;
> @@
> 
> f(e)
> 
> @@
> position p : script:python(r.e) { past_line_4(p, e) };
> expression r.e;
> @@
> 
> g(
> -e@p
> +27
>  )
> 
> In your case, I think that in the python code you should be able to access
> p1[0].current_element.  You can check that that is different than the
> name of the function that you want to ignore.  There are some limitations
> on what can be put in the {} in such a metavariable declaration, so if you
> have problems you can make a function, as shown in the example.  That code
> should return true if you want the match to take place and false
> otherwise.

Thanks! That worked great!
And the Python filtering looks super useful; I'm likely going to be
using that a lot :-)

Paul

> 
> julia
> 
> 
> 
> >   @@
> >
> >   (
> >     ep_tail_call(...);
> >     ... when forall
> >     return DROP_MISSED_TAIL_CALL;
> >   |
> >     ep_tail_call@p1(...);
> >   )
> >
> >   @rule2@
> >   position p2, rule1.p1;
> >   identifier fn != send_drop_notify;
> >   @@
> >
> >   fn(...) {
> >   <+...
> >   ep_tail_call@p1@p2(...);
> >   ...+>
> >   }
> >
> > When I tried using rule1 as the body of the function in rule2, it just
> > didn't match anything anymore.
> >
> > Thanks,
> > Paul
> > _______________________________________________
> > Cocci mailing list
> > Cocci@systeme.lip6.fr
> > https://systeme.lip6.fr/mailman/listinfo/cocci
> >
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
