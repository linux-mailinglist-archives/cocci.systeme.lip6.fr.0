Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C44325CED8
	for <lists+cocci@lfdr.de>; Fri,  4 Sep 2020 02:46:23 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0840jwVJ027968;
	Fri, 4 Sep 2020 02:45:58 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 339FC77BC;
	Fri,  4 Sep 2020 02:45:58 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E3D2F6717
 for <cocci@systeme.lip6.fr>; Fri,  4 Sep 2020 02:45:56 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0082.hostedemail.com
 [216.40.44.82])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0840jtTJ028961
 for <cocci@systeme.lip6.fr>; Fri, 4 Sep 2020 02:45:56 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave08.hostedemail.com (Postfix) with ESMTP id DD4F51801D1E3
 for <cocci@systeme.lip6.fr>; Thu,  3 Sep 2020 16:30:31 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id DAEE2182CF671;
 Thu,  3 Sep 2020 16:30:27 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2110:2393:2553:2559:2562:2693:2828:2892:3138:3139:3140:3141:3142:3354:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4321:4362:5007:7903:10004:10400:10848:11232:11658:11914:12050:12297:12740:12760:12895:13069:13311:13357:13439:14096:14097:14659:14721:21080:21451:21611:21627:21740:21939:30012:30054:30075:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: roof40_0911dc9270ab
X-Filterd-Recvd-Size: 3132
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Thu,  3 Sep 2020 16:30:27 +0000 (UTC)
Message-ID: <13de187ee83bb6ebffc6e4ff5f1c78d917ba9432.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Thu, 03 Sep 2020 09:30:23 -0700
In-Reply-To: <alpine.DEB.2.22.394.2009031711470.2496@hadrien>
References: <de28becbfe76575b18c0bf47567b7f9c20f15f87.camel@perches.com>
 <alpine.DEB.2.22.394.2008300854510.3629@hadrien>
 <b43fac2f903451dba4d5f4ac010b2ae5bfcad0c4.camel@perches.com>
 <alpine.DEB.2.22.394.2008301021250.3629@hadrien>
 <bc3215bbf6c217a06dc2ebbf6ddd977c5d57654c.camel@perches.com>
 <alpine.DEB.2.22.394.2008301742400.3629@hadrien>
 <7ce009d5f538feae7a6a20e0bbecdf73d74ea9f9.camel@perches.com>
 <alpine.DEB.2.22.394.2008302039000.3629@hadrien>
 <ec1cc3309738bf1acab87fcf9178dbf7b204176a.camel@perches.com>
 <alpine.DEB.2.22.394.2009022236330.2460@hadrien>
 <0db493cb85521ee26b7ca7c255e89721cc6b6dcd.camel@perches.com>
 <alpine.DEB.2.22.394.2009031711470.2496@hadrien>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 04 Sep 2020 02:46:00 +0200 (CEST)
X-Greylist: Delayed for 58:07:59 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Fri, 04 Sep 2020 02:45:56 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] transform oddity / bug ?
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

On Thu, 2020-09-03 at 17:14 +0200, Julia Lawall wrote:
> On Wed, 2 Sep 2020, Joe Perches wrote:
> > On Wed, 2020-09-02 at 22:46 +0200, Julia Lawall wrote:
> > > On Wed, 2 Sep 2020, Joe Perches wrote:
> > > > On Sun, 2020-08-30 at 20:41 +0200, Julia Lawall wrote:
> > > > > On Sun, 30 Aug 2020, Joe Perches wrote:
> > > > > > On Sun, 2020-08-30 at 17:46 +0200, Julia Lawall wrote:
> > > > > > > Unfortunately this does not work when the declaration
> > > > > > is comma terminated and not semicolon terminated.
> > > > []
> > > > > I will have to look into it.  It should handle this sort of thing, but it
> > > > > is somewhat complex, because the declarations have to be split and this
> > > > > specific case may not be handled.
> > > > 
> > > > Thanks.  Hope you can get to look at that one day.
> 
> It works if you replace the addition of the new declaration by ++.  It
> seems that it is concerned that if there are multiple variables in the
> original declaration then it may be necessary to do multiple additions and
> so it doesn't do anything for a single +.  You can see this information
> with the --debug option.

Thanks, works now.

> The newlines in the generated code are also not what one would hope for.
> I will see if this can be improved.

One day.

It's not urgent for me as all the proposed changes
would need to be checked manually and the rename can
cause other alignment issues around not just the
definition changes but in code too.

e.g.:
	written = sysfs_emit(buf,
			     "foo", bar...);
becomes
	len = sysfs_emit(buf,
			     "foo", bar...);

I have other scripts that can fix both the definition
and the alignment changes done by coccinelle.

cheers, Joe

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
