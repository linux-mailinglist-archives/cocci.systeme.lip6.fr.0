Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5DB1EC23F
	for <lists+cocci@lfdr.de>; Tue,  2 Jun 2020 20:58:05 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 052IvYDp026138;
	Tue, 2 Jun 2020 20:57:34 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 51DB47828;
	Tue,  2 Jun 2020 20:57:34 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8A34D3F9A
 for <cocci@systeme.lip6.fr>; Tue,  2 Jun 2020 20:57:32 +0200 (CEST)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20:0:0:0:52a])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 052IvVCx023892
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 2 Jun 2020 20:57:31 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id p18so10922469eds.7
 for <cocci@systeme.lip6.fr>; Tue, 02 Jun 2020 11:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cilium-io.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GtQimyTribB8diJhVxOmAJvq1d5v5zp2paaydutm3IA=;
 b=CjijUzayL/PI2Zt2aN6oUWPZiYuSvoTH2jNXn56guRMVUNFZrxTeOMdgk7xN+4eTt1
 AlmqCTMj0JtCaLbenkb9wWZRdh240+m1wsVMiSEH1WmBc1zsA+aH4E04jnEpk9/z3nDC
 PF1SBD0eTpPKyX5V6zr9xFvXcaRSb3/qy6Ao5JlGt5Zsnqz5u14f8RI3fvHudlmMXuUF
 TAISvfH65rtiIfAr9naAnx2vRoIUa6rcYSQdnQfqNB0nuIfSSfXkmUx5XyI70wCd8GyR
 mRZ7FFTzZg2Yb1uE9WaWy7YkCCDHTblTF4oHBMcHvEfKM30YGxjWAHfgxHBEKAgqrWhK
 aNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GtQimyTribB8diJhVxOmAJvq1d5v5zp2paaydutm3IA=;
 b=b+d0pW206hvwArpwTCz9h7fCLsdvnhQufVhYnhKVrS4uokkN+rQIYlK1l0Ws04Wa5M
 EEpWdB7IuTvyQT4gRYuB+ChsKNh0eHaSys4RZXIg3NEzDkT9ddciIVT6bwy+A4+pSwGt
 AdI89GjQpQQPLagZVixNlDfInZ/ij6ooxUtqjtkx8DURyoP1auZ3ydA7eoQJZ1f3Lnv8
 edrujNfz08zyL+IgON1e3svqetxjWMkANseY4+dDe/lTaa21qukUL0OeNVQuhng7cv9L
 CXl03MJ+EOO55NwyiccM7s1WJIHg35/YzqhseQCUcIdXR/Yb/+nlEYTkz3zvhP+gSDnd
 d1Qg==
X-Gm-Message-State: AOAM530kt5LOK8N6Po47AaOnZtvTGFb3uLdDTaN9lU/jWzmerGlxhRFt
 IlqPBWH4QRvSaun0oQv+1P1OzMkBSTck
X-Google-Smtp-Source: ABdhPJyYgJG8Z2bMx7C4bEcG+qNStJJG1/gCiQ4CRCKJy+w4wMB8CzQHXicife21qOuaHrS13hgwzw==
X-Received: by 2002:a50:a418:: with SMTP id u24mr17829855edb.141.1591124251125; 
 Tue, 02 Jun 2020 11:57:31 -0700 (PDT)
Received: from Mem ([81.30.78.170])
 by smtp.gmail.com with ESMTPSA id nw22sm2009674ejb.48.2020.06.02.11.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 11:57:30 -0700 (PDT)
Date: Tue, 2 Jun 2020 20:57:29 +0200
From: Paul Chaignon <paul@cilium.io>
To: Julia Lawall <julia.lawall@inria.fr>
Message-ID: <20200602185728.GA31643@Mem>
References: <20200602092802.GA24095@Mem>
 <alpine.DEB.2.21.2006021214430.4634@hadrien>
 <20200602124522.GA2774@Mem>
 <alpine.DEB.2.21.2006021453030.4634@hadrien>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2006021453030.4634@hadrien>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 02 Jun 2020 20:57:35 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 02 Jun 2020 20:57:31 +0200 (CEST)
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

On Tue, Jun 02, 2020 at 02:55:23PM +0200, Julia Lawall wrote:
> 
> 
> On Tue, 2 Jun 2020, Paul Chaignon wrote:
> 
> > On Tue, Jun 02, 2020 at 12:19:50PM +0200, Julia Lawall wrote:
> > >
> > >
> > > On Tue, 2 Jun 2020, Paul Chaignon wrote:
> > >
> > > > Hi all,
> > > >
> > > > I'm trying to find calls to ep_tail_call() that are *not* followed by
> > > > 'return DROP_MISSED_TAIL_CALL'. That works fine (rule1 below), but I then
> > > > want to whitelist one specific function, send_drop_notify().
> > > >
> > > > I couldn't find a way to do that from the first rule, so I whitelisted
> > > > send_drop_notify() with a second rule (rule2 below). That seems rather
> > > > cumbersome and I'm wondering if there's maybe a simpler approach?
> > > >
> > > >   @rule1@
> > > >   position p1;
> > >
> > > In coccinelle/tests/python_poscon.cocci you have an example of how to
> > > attach python code to a metavariable:
> > >
> > > @initialize:python@
> > > @@
> > >
> > > def past_line_4(p, other):
> > >     return int(p[0].line) > 4
> > >
> > > @r@
> > > expression e;
> > > @@
> > >
> > > f(e)
> > >
> > > @@
> > > position p : script:python(r.e) { past_line_4(p, e) };
> > > expression r.e;
> > > @@
> > >
> > > g(
> > > -e@p
> > > +27
> > >  )
> > >
> > > In your case, I think that in the python code you should be able to access
> > > p1[0].current_element.  You can check that that is different than the
> > > name of the function that you want to ignore.  There are some limitations
> > > on what can be put in the {} in such a metavariable declaration, so if you
> > > have problems you can make a function, as shown in the example.  That code
> > > should return true if you want the match to take place and false
> > > otherwise.
> >
> > Thanks! That worked great!
> > And the Python filtering looks super useful; I'm likely going to be
> > using that a lot :-)
> 
> You can refer to other metavariables, as illustrated by the example in
> tests, but they have to be nearby, ie no ... between them, and there
> should be no disjunctions involved.  This is to ensure that the matchig
> that led to th metavariable binding is deterministic.  If you violate
> these constraints, Coccinelle will complain, and you will have to make a
> separate python rule in the normal way.

I see. I often need to whitelist simple cases like the above, so
definitely useful despite limitations.

Thanks again for your help!

Paul

> 
> julia
> 
> 
> >
> > Paul
> >
> > >
> > > julia
> > >
> > >
> > >
> > > >   @@
> > > >
> > > >   (
> > > >     ep_tail_call(...);
> > > >     ... when forall
> > > >     return DROP_MISSED_TAIL_CALL;
> > > >   |
> > > >     ep_tail_call@p1(...);
> > > >   )
> > > >
> > > >   @rule2@
> > > >   position p2, rule1.p1;
> > > >   identifier fn != send_drop_notify;
> > > >   @@
> > > >
> > > >   fn(...) {
> > > >   <+...
> > > >   ep_tail_call@p1@p2(...);
> > > >   ...+>
> > > >   }
> > > >
> > > > When I tried using rule1 as the body of the function in rule2, it just
> > > > didn't match anything anymore.
> > > >
> > > > Thanks,
> > > > Paul
> > > > _______________________________________________
> > > > Cocci mailing list
> > > > Cocci@systeme.lip6.fr
> > > > https://systeme.lip6.fr/mailman/listinfo/cocci
> > > >
> >
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
