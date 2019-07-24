Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E83272735
	for <lists+cocci@lfdr.de>; Wed, 24 Jul 2019 07:13:52 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6O5DUKV005621;
	Wed, 24 Jul 2019 07:13:30 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 9C8A0778D;
	Wed, 24 Jul 2019 07:13:30 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from osiris.lip6.fr (osiris.lip6.fr [132.227.60.30])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E7784420D
 for <cocci@systeme.lip6.fr>; Wed, 24 Jul 2019 07:13:28 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0086.hostedemail.com
 [216.40.44.86])
 by osiris.lip6.fr (8.15.2/8.15.2) with ESMTP id x6O5DRnR015684
 for <cocci@systeme.lip6.fr>; Wed, 24 Jul 2019 07:13:28 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 478E718011E6A
 for <cocci@systeme.lip6.fr>; Wed, 24 Jul 2019 04:37:56 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 09734837F24C;
 Wed, 24 Jul 2019 04:37:54 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::,
 RULES_HIT:41:69:355:379:599:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:1801:2393:2553:2559:2562:2692:2693:2828:3138:3139:3140:3141:3142:3355:3622:3865:3866:3867:3868:3870:3871:3872:4321:4362:4605:5007:6119:7903:7904:8603:10004:10394:10400:10848:11026:11232:11233:11473:11658:11914:12043:12295:12297:12438:12683:12740:12760:12895:13161:13229:13439:14095:14181:14659:14721:21080:21324:21433:21627:21740:21789:30054:30070:30075:30090:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:24,
 LUA_SUMMARY:none
X-HE-Tag: girl57_aa862e6d3a45
X-Filterd-Recvd-Size: 3717
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf03.hostedemail.com (Postfix) with ESMTPA;
 Wed, 24 Jul 2019 04:37:53 +0000 (UTC)
Message-ID: <f909b4b31f123c7d88535db397a04421077ed0ab.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 23 Jul 2019 21:37:51 -0700
In-Reply-To: <alpine.DEB.2.21.1907232326360.2539@hadrien>
References: <7ab8957eaf9b0931a59eff6e2bd8c5169f2f6c41.1563841972.git.joe@perches.com>
 <66fcdbf607d7d0bea41edb39e5579d63b62b7d84.camel@perches.com>
 <alpine.DEB.2.21.1907231546090.2551@hadrien>
 <0f3ba090dfc956f5651e6c7c430abdba94ddcb8b.camel@perches.com>
 <alpine.DEB.2.21.1907232252260.2539@hadrien>
 <d5993902fd44ce89915fab94f4db03f5081c3c8e.camel@perches.com>
 <alpine.DEB.2.21.1907232326360.2539@hadrien>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 24 Jul 2019 07:13:32 +0200 (CEST)
X-Greylist: Delayed for 27:51:08 by milter-greylist-4.4.3 (osiris.lip6.fr
 [132.227.60.30]); Wed, 24 Jul 2019 07:13:28 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.30
Cc: cocci <cocci@systeme.lip6.fr>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cocci] [Fwd: [PATCH 1/2] string: Add stracpy and stracpy_pad
 mechanisms]
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

On Tue, 2019-07-23 at 23:27 -0500, Julia Lawall wrote:
> 
> On Tue, 23 Jul 2019, Joe Perches wrote:
> 
> > On Tue, 2019-07-23 at 22:54 -0500, Julia Lawall wrote:
> > > A seantic patch and the resulting output for the case where the third
> > > arugument is a constant is attached.  Likewise the resulting output on a
> > > recent linux-next.
> > > 
> > > julia
> > 
> > Nice.  Thanks Julia
> > 
> > A couple issues:
> > 
> > There is a problem with conversions with assignments
> > of strlcpy() so ideally the cocci script should make sure
> > any return value was not used before conversion.
> > 
> > This is not a provably good conversion:
> > 
> > drivers/s390/char/sclp_ftp.c
> > @@ -114,8 +114,7 @@ static int sclp_ftp_et7(const struct hmc
> >         sccb->evbuf.mdd.ftp.length = ftp->len;
> >         sccb->evbuf.mdd.ftp.bufaddr = virt_to_phys(ftp->buf);
> > 
> > -       len = strlcpy(sccb->evbuf.mdd.ftp.fident, ftp->fname,
> > -                     HMCDRV_FTP_FIDENT_MAX);
> > +       len = stracpy(sccb->evbuf.mdd.ftp.fident, ftp->fname);
> 
> Sorry, I don't understand the issue here.  What specifically should I be
> looking for?

The return value of strlcpy differs from (strscpy or stracpy).

strlcpy		returns the length of the src string
str[sa]cpy	returns the length of the src string if it fits in dest
		or -E2BIG if src is truncated by the size of dest
		or -E2BIG if dest is 0 length

Any use of the strlcpy return value should not be converted
because the logic after an assignment or use of the return value
can not be assured to have the same behavior.

> > And:
> > 
> > I would have expected the bit below to find and convert uses like
> > 	drivers/hwmon/adc128d818.c:     strlcpy(info->type, "adc128d818", I2C_NAME_SIZE);
> > but it seems none of those were converted.
> 
> OK, thanks.  I will check on it.

Thanks again.

> julia
> 
> > I don't know why.
> > 
> > //------------------------------------------
> > @r1@
> > struct i1 *e1;
> > expression e2;
> > identifier f,i1,i2;
> > position p;
> > @@
> > \(strscpy\|strlcpy\)(e1->f, e2, i2)@p
> > 
> > @@
> > identifier r1.i1,r1.i2;
> > type T;
> > @@
> > struct i1 { ... T i1[i2]; ... }
> > 
> > @@
> > identifier f,i2;
> > expression e1,e2;
> > position r1.p;
> > @@
> > (
> > -strscpy
> > +stracpy
> > -strlcpy
> > +stracpy
> > )(e1->f, e2
> > -    , i2
> >   )@p
> > //------------------------------------------
> > 
> > to find
> > 
> > 

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
